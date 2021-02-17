class MessageSerializer
  include FastJsonapi::ObjectSerializer
  set_type :message
  attributes :content, :sender, :recipient, :created_at, :updated_at
end
