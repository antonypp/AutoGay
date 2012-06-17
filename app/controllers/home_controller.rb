# coding: UTF-8
class HomeController < ApplicationController

  def index
   @violations = Car::Violation.with_state(:new).limit(9).all
  end

  def map
    @violations = Car::Violation.with_state(:new).limit(9).all
    @my_geo_objects = []
    @violations.each do |violation|
      geo_object = {
        geometry: {type: "Point", coordinates: [violation.lat, violation.long]},
        properties: {
        clusterCaption: violation.car.try(:number) || "Нет номера",
        balloonContentBody: violation.description
        }
      }
      @my_geo_objects << geo_object
    end
    @my_geo_objects = @my_geo_objects.to_json
  end
end
