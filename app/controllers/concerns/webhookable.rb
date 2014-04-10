module Webhookable
extend ActiveSupport::Concern
  def set_header
    response_headers['Content-Type']='text/xml'
  end

  def render_twiml(response)
    render text: response.text
  end
end
