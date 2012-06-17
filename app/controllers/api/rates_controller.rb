
class Api::RatesController < Api::ApplicationController
  def create
    violation = Car::Violation.find params[:violation_id]
    violation.judge params[:rate] == 'judge'
    head :ok
  end
end
