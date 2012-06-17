# coding: UTF-8
class ViolationsController < ApplicationController

  def index
   state = params[:state] || :new
   @violations = Car::Violation.with_state(state).paginate(:page => params[:page], :per_page => 9).all
  end

  def show
    @violation = Car::Violation.find(params[:id])
  end
end
