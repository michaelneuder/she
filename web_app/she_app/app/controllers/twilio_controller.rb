require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
    end

    render_twiml response
  end
end


rescue_from Standard Error do |exception|
  trigger_sms_alerts(exception)
end




def send_message(phone_number, message)
    twilio_number = ENV['twilioNumber']
    client = Twilio::Rest::Client.new ENV['twilioAccountSID'], ENV['twilioAuthToken']
    
    client.messages.create(
        from:   twilio_number,
        to:     phone_number,
        body:   message,
    )
end
