class App

  KNOWN_PARAMS = { 'year' => '%Y',
                   'month' => '%m',
                   'day' => '%d',
                   'hour' => '%H',
                   'minute' => '%M',
                   'second' => '%S' }

  def call(env)    
    [status,
     headers,
     body(CGI.unescape(env['QUERY_STRING']).delete_prefix('format=').split(','))]
  end

  private

  def status
    200
  end

  def headers
    { 'Content-type' => 'text/plain' }
  end

  def body(params)
    [Time.now.strftime(params.map { |param| KNOWN_PARAMS[param] }.join('-')) + "\n" ]
  end
end
