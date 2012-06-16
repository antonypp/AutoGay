require 'rexml/document'

class Api::ViolationsController < ApplicationController
  def index
    search = params[:get]
    result = search[:city] ? Car::Violation.last_10.find_by_city(City.find_by_name(search[:city])) : Car::Violation.last_10
    render 'views/api/index', result
  end
  def create
    viol_case = parameters[:case]

    number = viol_case[:number]
    car = Car.find_or_create :number => number

    violation = Violation.new()
    violation.description = viol_case[:description]

    image = viol_case[:image]
    violation.image_data = StringIO.new(Base64.decode64(image[:data]))
    violation.image_type = StringIO.new(Base64.decode64(image[:type]))

    location = viol_case[:location]
    violation.lat = location[:lat]
    violation.long = location[:long]
    violation.address = location[:address]

  end

end
