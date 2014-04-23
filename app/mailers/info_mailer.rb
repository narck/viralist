class InfoMailer < ActionMailer::Base
  default from: ENV['MSENDER']

  @subscribers = User.where(subscribed=true)

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to viralist!')
  end

  def inform_threshold(user)
  	mail(to: @user, subject: 'Threshold notice')
  end


end
