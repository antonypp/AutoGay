require 'spec_helper'

describe Car::Violation do
  context ".create" do
    it "with number" do
      violation = Car::Violation.create(description: "sdasasdas")
      violation.should be

    end
  end
end
