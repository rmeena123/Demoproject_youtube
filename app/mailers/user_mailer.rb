class UserMailer < ApplicationMailer
	 default from: 'rahulmeena@gmail.com'
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def playlist_email
    @playlist = params[:playlist]
    mail(to: @playlist.user.email, subject: 'playlist is Successfully created')
   end
  
   def successfull_subscription_email
     @subscription = params[:subscription_mail]
     mail(to: @subscription.user.email, subject: 'Subscribed successfully done')

   end

   def playlist_destroy_email
     @playlist_name = params[:name]
     @current_user = params[:current_user]
      mail(to: @current_user.email, subject: 'Playlist successfully destroy')
   end

end