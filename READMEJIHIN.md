### Understanding user story, domain modelling:

Verbs (actions):
land plane -
take off plane -
confirm plane not at airport -
stop plane take off if stormy
stop plane land if stormy
stop plane land if full
change airport capacity

Nouns(identify objects):
air traffic controller (does most of the controls)
plane
airport (has airport capacity)
passengers (not really anything mentioning passengers getting on and off the plane)
system designer (he wants to be able to change airport capacity)
weather (stormy or clear)
airport capacity (full or not)
destination (different instances of the airport class)


Objects  |   Messages
-------------------- | --------------------
plane | land, takeoff, ?confirm plane has left airport?
airport | ?confirm plane has left airport?, stop takeoff/land if stormy, stop land if full capacity, change capacity, passengers
weather | rand(stormy, clear)
air traffic controller |
system designer |


### Feature testing

To start off, I want to see if I can make a new airport:
```
heathrow = Airport.new
```
This throws up the error uninitialized Constant.

### Unit testing

I then write a spec test to either match the error I'm getting, or a test to solve a single issue I have been getting.
```
describe Airport do
end
```
Running `rspec` will fail, with the errior uninitialized Constant.

### Implementing code

I then open up `airport.rb` and create an `Airport` class.
Running both the rspec and unit test confirms that I have correctly implemented the code.


### first problem
