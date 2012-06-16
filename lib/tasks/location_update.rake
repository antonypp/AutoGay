namespace :violation do

  desc 'Updates not defined cities by yandex geoapi'
  task :update => :environment do
    Car::Violation.with_state(:queried).each do |violation|
      location = YandexApi.get_address(violation.long, violation.lat)
      puts location.inspect
      if location[:city]
        violation.city = City.find_by_name(location[:city])
      end
      if location[:area]
        violation.area = Area.find_by_name(location[:area])
      end
      violation.completion!
    end
  end
end
