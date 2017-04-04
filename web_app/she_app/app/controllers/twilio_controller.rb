#require 'twilio-ruby'

class TwilioController < ApplicationController
    #rescue_from Standard Error do |exception|
    #    trigger_sms_alerts(exception)
    #end

    def send_message(phone_number, message)
        twilio_number = ENV['twilioNumber']
        client = Twilio::Rest::Client.new ENV['twilioAccountSID'], ENV['twilioAuthToken']
    
    client.messages.create(
        from:   twilio_number,
        to:     phone_number,
        body:   message,
    )
end
