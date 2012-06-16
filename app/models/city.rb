#coding: UTF-8
class City < ActiveRecord::Base
  has_many :car_violations

end
