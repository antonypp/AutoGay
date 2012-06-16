# coding: UTF-8
class HomeController < ApplicationController

  def index
   @violations = Car::Violation.with_state(:new).limit(9).all
  end
end
