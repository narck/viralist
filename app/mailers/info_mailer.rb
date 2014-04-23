class InfoMailer < ActionMailer::Base
  default from: ENV['MSENDER']

  @subscribers = User.where(subscribed=true)

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to viralist!')
  end

  def inform_threshold(user)
    @user = user
    mail(to: @user.email, subject: 'Threshold notice')
  end


end
