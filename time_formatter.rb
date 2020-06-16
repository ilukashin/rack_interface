class TimeFormatter

  KNOWN_PARAMS = { 'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S' }

  def initialize(env)
    @env = env

    @params = CGI.unescape(@env['QUERY_STRING']).delete_prefix('format=').split(',')
    @unknown_params = @params.reject { |par| KNOWN_PARAMS.keys.include?(par) }
  end

  def valid?
    @unknown_params.empty?
  end

  def error_message
    "Unknown time format #{@unknown_params}\n"
  end

  def success_message
    Time.now.strftime(@params.map { |param| KNOWN_PARAMS[param] }.join('-')) + "\n"
  end
end
