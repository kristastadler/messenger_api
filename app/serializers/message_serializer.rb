class MessageSerializer
  include FastJsonapi::ObjectSerializer
  set_type :message
  attributes :content, :sender_id, :recipient_id
end 
