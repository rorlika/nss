class Newsletter < ApplicationRecord
  def self.deliver(id)
    find(id).update
    Subscriber.find_each do |subs|
      SubscriptionMailer.send_email(subs,find(id)).deliver_later
    end
  end

  def update
    update_attribute(:delivered_at, Time.zone.now)
  end
end
