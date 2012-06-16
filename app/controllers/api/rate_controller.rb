
class Api::RateController < ActionController::Base
  def create
    violation = Violation.find params[:violation_id]
    violation.judge params[:post] == 'judge'
  end
end