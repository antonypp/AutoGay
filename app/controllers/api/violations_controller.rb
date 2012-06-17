require 'rexml/document'

class Api::ViolationsController < Api::ApplicationController
  def index
    result = Car::Violation.limit(10).find_by_city(City.find_by_name(params[:city]))
    render 'views/api/violations/index', :locals => {:violations => result}
  end
  def create
    viol_case = params


    number = viol_case[:number]
    car = Car.find_or_create_by_number :number => number

    violation = Car::Violation.new()

    violation.description = viol_case[:description]
    violation.image_data = viol_case[:image]
    violation.lat = viol_case[:lat]
    violation.long = viol_case[:long]
    violation.address = viol_case[:address]
    violation.save()
    logger.debug violation.image_file_name

    car.violations<< violation

    car.save()

    head :ok
  end
  def show(id)
    render 'views/api/violation/show', Car::Violation.find(id)
  end
end
