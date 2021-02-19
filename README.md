# Messenger API

### Overview

This project is a backend Rails application. The endpoints are designed to support a web-application that enables tow users to send short text messages to each other, like Facebook Messages app or Google Chat.

### Author

- [Krista Stadler](https://github.com/kristastadler)

### Local Setup & Invoking the API

- Clone
- bundle
- rails db:{create,migrate,seed}
- rails s
- All endpoints are available at: `http://localhost:3000/api/v1/`
- Requests to the API can be made using a tool like Postman or by using curl on the command line.

### Running the Test Suite

- `bundle exec rspec` can be run from the command line to see test coverage of the API.
- SimpleCov test coverage is at 100% for this project, but given more time, I would add more sad path testing.

### Endpoints
  - GET `messages`
    - This endpoint can be used with two different limit param options:
      - `messages?limit=days`
        - Description: Returns messages from all senders from the last 30 days
      - `messages?limit=count`
        - Description: Returns the last 100 messages sent by any sender
  - GET `messages\:recipient_id`
    - This endpoint must always include the `sender` param and one of the `limit` param options:
      - `messages/:recipient_id?sender=:sender_id&limit=days`
        - Description: Returns all messages to the recipients from the specific sender from the last 30 days
      - `messages/:recipient_id?sender=:sender_id&limit=count`
        - Description: Returns the last 100 messages to the recipient from the specific sender
  - POST `messages`
    - Description: Posts a short message from one user to another to the Messages API PostgreSQL database
    - Requires `content`, `sender_id`, and `recipient_id` to be sent in the request body as JSON
    - Example Request Body:
    ``{ "content": "Boil 'em, mash 'em, stick 'em in a stew!", "sender_id": 1, "recipient_id": 2 }``
