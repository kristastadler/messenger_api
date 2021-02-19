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
- All endpoints are available at: `http://localhost:3000/api/v1`
- Requests to the API can be made using a tool like Postman or by using curl on the command line.

### Running the Test Suite

- `bundle exec rspec` can be run from the command line to see test coverage of the API.
- SimpleCov test coverage is at 100% for this project, but given more time, I would add more sad path testing.

### Endpoints
  - `messages`
    - Description: Returns messages from all senders limited to either the last 30 days or last 100 messages sent
    - Param Requirements
      - `limit` param is required and can be set to:
        - `days` if messages from the last 30 days are needed
        - `count` if last 100 messages are needed
    - Param Formatting:
      - For `days`:
        - ``limit=days``
      - For `count`:
        - ``limit=count`` 
