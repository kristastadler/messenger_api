require 'rails_helper'

describe "Messages API" do
  it "can send a message between two users" do
    frodo = User.create!(username: "shireguy")
    sam = User.create!(username: "potatolover")

    post "/api/v1/messages", params: { content: "Boil 'em, mash 'em, stick 'em in a stew!",
                                       sender_id: sam.id,
                                       recipient_id: frodo.id }
    message = Message.last
    body = JSON.parse(response.body)
    expect(response).to be_successful
    expect(message.content).to eq("Boil 'em, mash 'em, stick 'em in a stew!")
    expect(message.recipient.username).to eq("shireguy")
    expect(message.sender.username).to eq("potatolover")
  end

  it "displays an error if the sender doesn't exist" do
    frodo = User.create!(username: "shireguy")

    post "/api/v1/messages", params: { content: "We've got to get the Ring back to Mordor, ASAP!",
                                       sender_id: frodo.id,
                                       recipient_id: 7 }

    body = JSON.parse(response.body)
    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    expect(body["error_message"]).to eq("Oops, looks like at least one of those users doesn't exist!")
  end

  it "displays an error if the recipient doesn't exist" do
    frodo = User.create!(username: "shireguy")

    post "/api/v1/messages", params: { content: "We've got to get the Ring back to Mordor, ASAP!",
                                       sender_id: 18,
                                       recipient_id: frodo.id }

    body = JSON.parse(response.body)
    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    expect(body["error_message"]).to eq("Oops, looks like at least one of those users doesn't exist!")
  end
end
