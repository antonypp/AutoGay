# coding: utf-8
require 'spec_helper'

describe YandexApi do

  it "get_address" do
    long = 48.395775
    lat = 54.314974
    location = YandexApi.get_address(long,lat)
    location.should be
    location[:area] = "Ульяновская область"
    location[:city] = "Ульяновск"
  end

end
