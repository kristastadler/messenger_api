require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  describe "relationships" do
    it {should have_many :messages}
  end

  describe "instance methods" do
    it "can get sender specific messages from the last 30 days" do
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
      expect(frodo.sender_specific_messages(sam.id, "days")).to include(message_1)
      expect(frodo.sender_specific_messages(sam.id, "days")).to include(message_2)
      expect(frodo.sender_specific_messages(sam.id, "days")).to include(message_3)
      expect(frodo.sender_specific_messages(sam.id, "days")).to_not include(message_4)
      expect(frodo.sender_specific_messages(sam.id, "days")).to_not include(pippin_message)
      expect(frodo.sender_specific_messages(pippin.id, "days")).to eq([pippin_message])
    end
    it "can get the last 100 sender specific messages" do
      frodo = User.create!(username: "shireguy")
      sam = User.create!(username: "potatolover")
      pippin = User.create!(username: "sonofatook")

      120.times do |i|
        m = Message.create(
          content: Faker::Movies::LordOfTheRings.quote,
          sender_id: sam.id,
          recipient_id: frodo.id
        )
      end

      message = Message.create!(
        content: Faker::Movies::LordOfTheRings.quote,
        sender_id: sam.id,
        recipient_id: frodo.id,
        created_at: "2021-01-10T05:01:52.194Z",
        updated_at: "2021-01-10T05:01:52.194Z"
      )

      5.times do |i|
        m = Message.create(
          content: Faker::Movies::LordOfTheRings.quote,
          sender_id: pippin.id,
          recipient_id: frodo.id
        )
      end
      expect(frodo.sender_specific_messages(sam.id, "count").length).to eq(100)
      expect(frodo.sender_specific_messages(pippin.id, "count").length).to eq(5)
    end
  end
end
