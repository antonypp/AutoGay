# coding: UTF-8
class ViolationsController < ApplicationController

  def index
   @violations = Car::Violation.limit(10).all
  end

  def show
    @violation = Car::Violation.find(params[:id])
    raise @violation.inspect
  end
end
