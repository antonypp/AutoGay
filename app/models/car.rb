#coding: UTF-8
class Car < ActiveRecord::Base
  has_many :car_violations

  before_validation :correct_number

  protected

  def correct_number
    number.upcase!
  end
end
