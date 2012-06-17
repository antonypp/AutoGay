namespace :twitter do

  desc 'Send violation to twitter'
  task :send => :environment do
    Car::Violation.with_state(:new).each do |violation|
      begin
        res = Twitter.update_with_media violation.description,
                                File.new(violation.image.path),
                                {:long => violation.long, :lat => violation.lat, :display_coordinates => 'true'}
        violation.send_by_server!
      rescue
        # ignored
      end
    end
  end
end

