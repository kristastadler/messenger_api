class User < ApplicationRecord
  has_many :messages, class_name: "Message", foreign_key: "recipient_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  validates :username, uniqueness: true, presence: true
  
  def sender_specific_messages(sender, limit)
    if limit == "days"
      self.messages.where(sender_id: sender).where('created_at > ?', 30.days.ago)
    elsif limit == "count"
      self.messages.where(sender_id: sender).order(created_at: :desc).limit(100)
    end
  end
end
