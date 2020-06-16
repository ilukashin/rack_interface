class App

  def call(env, service)
    if service.valid?
      service.success_response
    else
      service.error_response
    end
  end
end
