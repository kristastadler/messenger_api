require 'faker'

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
100.times do |i|
  m = Message.create(
    content: Faker::Movies::LordOfTheRings.quote,
    sender_id: sam.id,
    recipient_id: frodo.id
  )
end

50.times do |i|
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
