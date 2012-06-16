# coding: UTF-8
class ViolationsController < ApplicationController

  def index
   @violations = Car::Violation.with_status(:new).limit(10).all
  end

  def show
    @violation = Car::Violation.find(params[:id])
    raise @violation.inspect
  end
end
