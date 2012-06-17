class CommentsController < ApplicationController
  def create
    violation = Car::Violation.find params[:violation_id]
    comment = Car::Violation::Comment.new :text => params[:comment], :violation => violation
    comment.save()
    render :partial => 'comments/item', :locals => {comment: comment}
  end
end