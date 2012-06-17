
class Api::RatesController < Api::ApplicationController
  def create
    violation = Car::Violation.find_by_id params[:violation_id]
    if violation
      violation.judge params[:rate] == 'judge'
      head :ok
    else
      head :not_found
    end
  end
end
