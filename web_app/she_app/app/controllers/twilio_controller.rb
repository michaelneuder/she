class TwilioController < ApplicationController
    def index
    end

    # @param params [Hash] holds user params and phone number
    # @param ENV [Hash] holds environmental variables
    # @note  Sends message to 
    def send_message
        phone_number = params[:phone_number]
        twilioSID = ENV['twilioAccountSID']
        twilioAuthToken = ENV['twilioAuthToken']
        twilioNumber = ENV['twilioNumber']

        @client = Twilio::Rest::Client.new twilioSID, twilioAuthToken

        @client.account.sms.messages.create(
         :from => twilio_number,
         :to => "+1" + phone_number,
         :body => "Thank you for signing up!"
        )
    end
end
