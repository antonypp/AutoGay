# coding: UTF-8
class HomeController < ApplicationController

  def index
   @violations = Car::Violation.limit(10).all
  end
end
