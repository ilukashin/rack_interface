class Routes

  def initialize(app)
    @app = app
  end

  def call(env)
    return not_found unless corresponding_request?(env)
    
    @app.call(env)
  end

  private

  def corresponding_request?(env)
    env['REQUEST_PATH'].eql?('/time') &&
     env['REQUEST_METHOD'].eql?('GET')
  end

  def not_found
    [404, {}, ["Page not found\n"]]
  end
end
