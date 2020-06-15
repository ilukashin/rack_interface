class Params

  def initialize(app)
    @app = app
  end

  def call(env)
    params = CGI.unescape(env['QUERY_STRING']).delete_prefix('format=').split(',')

    unknown_params = params.reject { |par| App::KNOWN_PARAMS.keys.include?(par) }

    return [status, headers, body(unknown_params)] unless unknown_params.empty?

    @app.call(env)
  end

  private

  def status
    400    
  end

  def headers
    { 'Content-type' => 'text/plain' }
  end

  def body(params)
    ["Unknown time format #{params}\n"]
  end
end
