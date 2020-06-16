class App

  def call(env, service)
    if service.valid?
      success_response(service.success_message)
    else
      error_response(service.error_message)
    end
  end

  private

  def success_response(body)
    response_template(200, body)
  end

  def error_response(body)
    response_template(400, body)
  end

  def response_template(status_code, body)
    [status_code, { 'Content-type' => 'text/plain' }, [body]]
  end
end
