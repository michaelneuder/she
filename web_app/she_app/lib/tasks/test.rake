namespace :test do
  desc "Output users"
  task out: :environment do
    User.all.each do |user|
      puts user.to_s
    end
  end
  desc "User"
  task :user => :environment do
    puts User.all.inspect
  end

end
