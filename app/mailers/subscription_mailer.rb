class SubscriptionMailer < ApplicationMailer
  def send_email(subscriber, newsletter)
    mail(to: subscriber.email,
         body: newsletter.body,
         content_type: "text/html",
         subject: newsletter.subject)
  end
end
