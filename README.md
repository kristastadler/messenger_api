# Messenger API

### Overview

This project is a backend Rails API. The endpoints are designed to support a web-application that enables two users to send short text messages to each other, like Facebook Messages app or Google Chat.

### Author
- [Krista Stadler](https://github.com/kristastadler)

### Local Setup & Invoking the API
- Clone
- bundle
- rails db:{create,migrate,seed}
- rails s
- All endpoints are available at: `http://localhost:3000/api/v1/`
- Requests to the API can be made using a tool like Postman or by using curl on the command line.

### Additional Notes About Invoking the API
  - This project includes database seeds that can be used in the API calls. For seed details, reference "/db/seeds.rb"
  - This project also includes added functionality to send a POST request and create a new user. Once new users have been created, their user ids can also be used to make post requests to the `messages` endpoint.   

### Running the Test Suite
- `bundle exec rspec` can be run from the command line to see test coverage of the API.
- SimpleCov test coverage is at 100% for this project, but given more time, I would add more sad path testing, especially in the following areas:
  - The GET `messages/:recipient_id` endpoint would benefit from additional error handling to manage scenarios where an invalid recipient_id is included in the endpoint. Right now, this scenario returns an ActiveRecord::RecordNotFound response.
  - Additional error handling for when endpoints are invoked without necessary params. Currently, when endpoints are run without necessary information (or with an unknown sender_id), the request is successful, it just returns an empty array in the response. In an ideal state, it would return a more useful error message to aid the web application team with troubleshooting.

### Endpoints
  - POST `users`
    - Description: Posts a new user to the Messages API PostgreSQL database
    - Requires `username` to be sent in the request body as JSON
    - Example Request Body:
    ``{ "username": "brandybuckwild" }``
  - GET `messages`
    - This endpoint must be used with two different limit param options:
      - `messages?limit=days`
        - Description: Returns messages from all senders from the last 30 days
      - `messages?limit=count`
        - Description: Returns the last 100 messages sent by any sender
  - GET `messages/:recipient_id`
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
