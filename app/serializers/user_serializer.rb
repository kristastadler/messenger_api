class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  attributes :username, :created_at, :updated_at
end
