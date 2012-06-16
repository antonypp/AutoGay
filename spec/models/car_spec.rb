# coding: UTF-8
require 'spec_helper'

describe Car do
  context ".create" do
    it "with number" do
      violation = Car.create(number: "A567rt73")
      violation.should be
    end

    it "with downcase number" do
      violation = Car.create(number: "A567rt73")
      violation.number.should == "A567RT73"
    end

    it "with cyrillic number" do
      violation = Car.create(number: "A567rt73")
      violation.number.should == "A567RT73"
    end
  end
end
