require 'rails_helper'

describe "Messages API" do
  it "can get all of a recipient's messages from a specific sender for the last 30 days" do
    frodo = User.create!(username: "shireguy")
    sam = User.create!(username: "potatolover")
    pippin = User.create!(username: "sonofatook")

    message_1 = Message.create!(content: "You're my best friend, Frodo!",
                                sender_id: sam.id,
                                recipient_id: frodo.id,
                                created_at: "2021-02-04T05:01:52.194Z",
                                updated_at: "2021-02-04T05:01:52.194Z")
    message_2 = Message.create!(content: "When do we leave for Mordor?",
                                sender_id: sam.id,
                                recipient_id: frodo.id,
                                created_at: "2021-02-10T05:01:52.194Z",
                                updated_at: "2021-02-10T05:01:52.194Z")
    pippin_message = Message.create!(content: "oooh, shiny ball!",
                                     sender_id: pippin.id,
                                     recipient_id: frodo.id,
                                     created_at: "2021-02-10T05:01:52.194Z",
                                     updated_at: "2021-02-10T05:01:52.194Z")
    message_3 = Message.create!(content: "I miss potatoes.",
                                sender_id: sam.id,
                                recipient_id: frodo.id,
                                created_at: "2021-02-17T05:01:52.194Z",
                                updated_at: "2021-02-17T05:01:52.194Z")
    message_4 = Message.create!(content: "Isn't Gandalf visiting soon?",
                                sender_id: sam.id,
                                recipient_id: frodo.id,
                                created_at: "2021-01-10T05:01:52.194Z",
                                updated_at: "2021-01-10T05:01:52.194Z")
    get "/api/v1/messages/#{frodo.id}?sender=#{sam.id}&limit=days"
    body = JSON.parse(response.body)
    expect(response).to be_successful
    expect(body["data"].length).to eq(3)

  end


  end
