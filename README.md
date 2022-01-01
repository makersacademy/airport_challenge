# Airport Challenge

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```
---

## Objective

The client would like software to control the passage of planes through an airport. The operation of planes will involve landing and taking off providing it is safe to do so in the current weather condition. User stories have be established for the development of the software.

### User stories

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

## Approach

The approach is to rigorously use the red-green-refactor TDD cycle to construct the software needed to meet the client's requirements. This involves the following:

- [Extracting a domain model from the user stories](#domain-modelling)
- [Feature / acceptance tests](#featur-test)
- [Unit tests](#unit-test)
- [Make tests pass](#make-test-pass)
- [Refactor](#refactor)

### Domain modelling

To extract the domain model from the user stories, the key nouns and verbs would be taken and sorted into objects and messages.

##### Example
###### User story 1
> As an air traffic controller <br>
So I can get passengers to a destination <br>
I want to instruct a <mark style="background-color: #00bbff">plane</mark> to <mark style="background-color: #ff9900">land</mark> at an <mark style="background-color: #00bbff">airport</mark>

<br>

<div align="center">

| Object (noun) | Message (verb) |
| --- | --- |
| Plane | land |
| Airport | |
</div>

<br>

After sorting the words into their relative columns, a diagram with words and arrows would be used to indicate how the objects and messages would act on each other. Arrows pointing to the right would imply that the following word would be the output of the previous word. An arrow pointing left would imply that the word on the right of it would be a message or an argument passed to the word on the left of the arrow.

##### Examples

```
Airport  <---  land  <---  Plane
```
```
Airport  <---  full?  --->  true/false
```
### Feature test

A feature test would then be implimented based on the domain model.

##### Example
```irb
3.0.2 :003 > airport = Airport.new
 => #<Airport:0x00007f9ef814e378> 
3.0.2 :004 > airport.full?
(irb):4:in `<main>': undefined method `full?' for #<Airport:0x00007f9ef814e378> (NoMethodError)
```

### Unit test

The creation of a unit test would happen once an error message was received from the failing feature test.

### Make test pass

This is the part where the implimentation of the software happens. Code is written in the simplest way to make the test pass.

### Refactor

When a feature is working and passes the associated tests, it would be checked to see if the code could be made simpler and more readable. After this it's back to another feature test and the cycle continues!

## Improvments

The weather feature for the last two user stories is not complete yet. The plan at the moment is to allow an airport to use the Weather class to check the weather condition before letting a plane take off or land. If the weather is 'stormy' an error will be raised to prevent landing and take off.

So far, the Weather class has been created so the next step would be to write a test to check that a plane cannot take off from an airport in stormy weather.

To finish the challenge, the same approach would be taken to prevent landing when the weather is stormy.