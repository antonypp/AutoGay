# coding: UTF-8
class Api::CommentsController < Api::ApplicationController
  def create
    violation = Car::Violation.find params[:violation_id]
    comment = Car::Violation::Comment.new :text => params[:post], :violation => violation
    comment.save()
    head :OK
  end
end
