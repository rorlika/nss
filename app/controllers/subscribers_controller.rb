class SubscribersController < ApplicationController
  def index
    @subscriber = Subscriber.all
  end
  def new
    @subscriber = Subscriber.new
  end
  def show
    @subscriber = Subscriber.all
    @subscriber.each do |subs|
      SubscriptionMailer.send_email(subs.email,"rails").deliver_later!(wait: 1.hour)
    end
  end
  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      flash[:success] = "Thank you for subscribing!"
      redirect_to(:action => 'new')
    else
      render('new')
    end
  end

  private
    def subscriber_params
      params.require(:subscriber).permit(:email)
    end
end
