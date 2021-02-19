class Message < ApplicationRecord
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"

  def self.get_messages_from_all_senders(limit)
    if limit == "days"
      self.where('created_at > ?', 30.days.ago)
    elsif limit == "count"
      self.order(created_at: :desc).limit(100)
    end
  end
end
