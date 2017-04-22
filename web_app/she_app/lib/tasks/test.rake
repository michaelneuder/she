
namespace :test do
  desc "Output users"
  task out: :environment do
    User.all.each do |user|
      puts user.to_s
    end
  end

  desc "Output users"
  task handle: :environment do
    puts User.first.twitter_handle
  end



  desc "User"
  task :user => :environment do
    puts Rails.env
    puts User.all
  end

  desc "New User"
  task new: :environment do
    User.new(name: "Fake User", email: "fakkkemail@yahoo.com",
                      password: "password", password_confirmation: "password",
                      twitter_handle: "AlexUrbanski")
  end

end
