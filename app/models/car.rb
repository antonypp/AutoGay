#coding: UTF-8
class Car < ActiveRecord::Base
  has_many :car_violations

end
