class TwilioController < ApplicationController
    def index
    end

    #def send_message(phone_number, message)
    def send_message
        twilioSID = ENV['twilioAccountSID']
        twilioAuthToken = ENV['twilioAuthToken']
        twilioNumber = ENV['twilioNumber']
        clientNumber = ENV['clientNumber']
        @client = Twilio::Rest::Client.new twilioSID, twilioAuthToken
    
        @client.account.sms.messages.create(
         :from => twilio_number,
         :to => phone_number,
         :body => "Sample text message. From your significantly virtual girlfriend."
        )
    end
end
