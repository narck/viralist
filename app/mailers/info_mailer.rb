class InfoMailer < ActionMailer::Base
  default from: ENV['MSENDER']

  @subscribers = User.where(subscribed=true)

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to viralist!')
  end

  def inform_threshold(user)
    stores = Store.all
    @over_threshold = []
    @nearing_threshold = []

    for store in stores
      if store.threshold_exceeded
        @over_threshold.push store
      end
      if store.nearing_threshold and not store.threshold_exceeded
        @nearing_threshold.push store
      end
    end

    @user = user
    mail(to: @user.email, subject: 'Threshold notice')
  end


end
