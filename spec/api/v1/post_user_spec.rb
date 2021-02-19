require 'rails_helper'

describe "Messages API" do
  it "can send create a new user" do

    post "/api/v1/users", params: { username: "brandybuckwild" }
    user = User.last
    body = JSON.parse(response.body)
    expect(response).to be_successful
    expect(user.username).to eq("brandybuckwild")
  end
end
