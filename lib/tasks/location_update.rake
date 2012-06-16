namespace :app do

  desc 'Updates not defined cities by yandex geoapi'
  task :update do |env|
    Car::Violation.queried.each do |violation|
      location = YandexApi.get_address(violation.long, violation.lat)
      if location[:city]
        violation.city = City.find_by_name(location[:city])
      end
      if location[:area]
        violation.area = Area.find_by_name(location[:area])
      end
    end
  end
end