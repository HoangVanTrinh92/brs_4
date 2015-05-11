class CommentsController < ApplicationController

  def create
    @review = Review.find params[:review_id]
    @comment = @review.comments.new comment_params
    if @comment.save
      respond_to do |format|
        format.js
      end
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit :user_id, :review_id, :content
  end

end
