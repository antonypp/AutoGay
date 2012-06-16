
class Api::RateController < Api::ApplicationController
  def create
    violation = Car::Violation.find params[:violation_id]
    violation.judge params[:post] == 'judge'
    head :OK
  end
end