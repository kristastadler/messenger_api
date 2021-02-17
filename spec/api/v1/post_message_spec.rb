require 'rails_helper'

describe "Messages API" do
  it "can send a message between two users" do
    frodo = User.create!(username: "shireguy")
    sam = User.create!(username: "potatolover")

    post "/api/v1/messages", params: { content: "Boil 'em, mash 'em, stick 'em in a stew!",
                                       sender_id: sam.id,
                                       recipient_id: frodo.id }
    message = Message.last
    parse_message = JSON.parse(response.body)
    expect(response).to be_successful
    expect(message.content).to eq("Boil 'em, mash 'em, stick 'em in a stew!")
    expect(message.recipient.username).to eq("shireguy")
    expect(message.sender.username).to eq("potatolover")
  end
end 
