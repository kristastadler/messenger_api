class User < ApplicationRecord
  has_many :messages, class_name: "Message", foreign_key: "recipient_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"

  def sender_specific_messages(sender, limit)
    if limit == "days"
      self.messages.where(sender_id: sender).where('created_at > ?', 30.days.ago)
    end
  end
end
