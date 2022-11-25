class CommentsController < ApplicationController
	def create
    @comment = current_user.comments.create(comment_params)
    redirect_to welcome_path(@comment.post) 
	end
  
  def destroy
    @comment = current_user.comments.find_by(comment_params)
    @comment.destroy
    redirect_to welcome_path(@comment.post) 
  end
  private
    def comment_params
      params.permit(:post_id, :text)
    end
end
