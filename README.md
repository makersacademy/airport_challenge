# Airport Challenge

For this challenge, I am creating a set of classes and modules to simulate air traffic control at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

## Approach

My approach was to build a domain model from the the user stories and create a diagram for how the objects will use the messages to communicate with one another.

Airport <-----land_plane/take_off -----> a plane

Plane <-----stormy?-----> true/false?

After some consideration and to separate concerns, I designed three classes: **Airport**, **Plane**, **Weather**.

I feature tested the user stories and used the errors to drive my TDD process.

## User Stories/ Requirements

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

## Installation

```
git clone {URL}
```

```
bundle install
```

## Run Tests

```
rspec
```

This challenge is incomplete.
