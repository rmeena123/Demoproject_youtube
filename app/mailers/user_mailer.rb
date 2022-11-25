class UserMailer < ApplicationMailer
	 default from: 'rm2222@gmail.com'
  def welcome_email
    @user = params[:user]
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end