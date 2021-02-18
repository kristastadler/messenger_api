# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
frodo = User.create!(username: "shireguy")
sam = User.create!(username: "potatolover")

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
