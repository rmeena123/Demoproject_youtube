class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
      subscription = current_user.subscriptions.last
      if subscription.present? &&subscription.razorpay_payment_id.present? && DateTime.now < subscription.end_time
          @category = Category.find_by(id: params["category_id"])
          if @category.present?
           @post=@category.posts.post_enable
         elsif params["name"].present? 
          @post =Post.post_enable.where('name like ?',"#{params["name"]}%")
        else
          @post = Post.post_enable
        end
     else
       flash.alert = "Please subscribe see all the posts"
       render 'pleasesubscribe'
    end
   end

   def show
    @post=Post.find_by(id:params[:id])  
    @post.video.attached?
    @post.video
   end 
 end


