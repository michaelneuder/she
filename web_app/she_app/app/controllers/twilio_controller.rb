class TwilioController < ApplicationController
    def index
    end

    #def send_message(phone_number, message)
    def send_message
        twilioSID = ENV['twilioAccountSID']
        twilioAuthToken = ENV['twilioAuthToken']
        twilio_number = ENV['twilioNumber']
        @client = Twilio::Rest::Client.new twilioSID, twilioAuthToken
    
        client.messages.create(
            from:   twilio_number,
            to:     phone_number,
            body:   message,
        )
    end
end
