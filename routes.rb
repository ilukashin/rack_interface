class Routes

  KNOWN_ROUTES = { '/time' => { :methods => ['GET'], :service => TimeFormatter }}

  def initialize(app)
    @app = app
  end

  def call(env)
    return not_found unless corresponding_request?(env)
    
    @app.call(env, KNOWN_ROUTES[env['REQUEST_PATH']][:service].new(env))
  end

  private

  def corresponding_request?(env)
    path = env['REQUEST_PATH']
    method = env['REQUEST_METHOD']

    KNOWN_ROUTES[path] && KNOWN_ROUTES[path][:methods].include?(method)
  end

  def not_found
    [404, {}, ["Page not found\n"]]
  end
end
