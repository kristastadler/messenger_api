require 'rails_helper'
require 'faker'

describe "Messages API" do
  it "can get all messages send in the last 30 days" do
    frodo = User.create!(username: "shireguy")
    sam = User.create!(username: "potatolover")
    pippin = User.create!(username: "sonofatook")

    message_1 = Message.create!(content: "You're my best friend, Frodo!",
                                sender_id: pippin.id,
                                recipient_id: frodo.id,
                                created_at: "2021-01-04T05:01:52.194Z",
                                updated_at: "2021-01-04T05:01:52.194Z")
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
                                created_at: "2021-01-01T05:01:52.194Z",
                                updated_at: "2021-01-01T05:01:52.194Z")
    message_4 = Message.create!(content: "Isn't Gandalf visiting soon?",
                                sender_id: sam.id,
                                recipient_id: frodo.id,
                                created_at: "2021-02-10T05:01:52.194Z",
                                updated_at: "2021-02-10T05:01:52.194Z")
    message_5 = Message.create!(content: "We leave tomorrow, Sam",
                                sender_id: frodo.id,
                                recipient_id: sam.id,
                                created_at: "2021-02-10T05:01:53.194Z",
                                updated_at: "2021-02-10T05:01:53.194Z")
    get "/api/v1/messages?limit=days"
    body = JSON.parse(response.body)
    expect(response).to be_successful
    expect(body["data"].length).to eq(4)
  end

  xit "can get the last 100 messages to a recipient from a specific sender" do
    frodo = User.create!(username: "shireguy")
    sam = User.create!(username: "potatolover")
    pippin = User.create!(username: "sonofatook")

    30.times do |i|
      m = Message.create(
        content: Faker::Movies::LordOfTheRings.quote,
        sender_id: sam.id,
        recipient_id: frodo.id
      )
    end

    40.times do |i|
      m = Message.create(
        content: Faker::Movies::LordOfTheRings.quote,
        sender_id: pippin.id,
        recipient_id: frodo.id
      )
    end

    50.times do |i|
      m = Message.create(
        content: Faker::Movies::LordOfTheRings.quote,
        sender_id: frodo.id,
        recipient_id: sam.id
      )
    end

    get "/api/v1/messages?limit=count"
    body = JSON.parse(response.body)
    expect(response).to be_successful
    expect(body["data"].length).to eq(100)
  end
end
