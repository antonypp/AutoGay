require 'rexml/document'

class Api::ViolationsController < Api::ApplicationController
  def index
    @violations = Car::Violation.limit(10).all
    #.find_by_city_id(:city_id => City.find_by_name(params[:city]).id)
    render :format => :json
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
