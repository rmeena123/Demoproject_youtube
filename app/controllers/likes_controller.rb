class LikesController < ApplicationController

	def create
    @post = Post.find_by(id: params["post_id"])
    @like = @post.likes.find_by(user_id: current_user.id)
    unless @like.present?
      @post.likes.create(user_id: current_user.id)
      @post.count = @post.count + 1
      @post.save
      respond_to do |format|
        format.html
        format.js {render 'create'}
      end
    else
      @like.destroy
      @post.count = @post.count - 1
      @post.save
      respond_to do |format|
        format.html
        format.js {render 'unlike'}
      end
    end
  end
  
end


