class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def yeezy
    render html: "My greatest pain in life is that I will never be able to see myself perform live. - Kanye"
  end
end
