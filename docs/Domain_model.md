## User Stories ##

1. **Story 1**
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

nouns: air traffic controller, plane, airport
verbs: instruct to land

Objects  | Messages
------------- | -------------
air traffic controller  |  
plane  |
airport  | instruct plane to land

airport > instruct plane to land > plane


2. **Story 2**
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

nouns: air traffic controller, plane, airport
verbs: instruct to take off, confirm it's no longer at the airport

Objects  | Messages
------------- | -------------
air traffic controller  |  
plane  | instruct to take off
airport  | confirm plane is no longer at airport

instruct to take off > airport > plane no longer at airport

3. **Story 3**
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

nouns: air traffic controller, weather, airport (implicitly?)
verbs: prevent takeoff, stormy

Objects  | Messages
------------- | -------------
air traffic controller  |  
weather  | stormy
airport  | prevent takeoff

weather > stormy > prevent takeoff > airport

4. **Story 4**
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

nouns: air traffic controller, weather, airport (implicitly?)
verbs: ensure safety, prevent landing

Objects  | Messages
------------- | -------------
air traffic controller  |  
weather  | stormy
airport  | prevent landing

weather > stormy > prevent landing > airport

5. **Story 5**
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

nouns: air traffic controller, airport
verbs: ensure safety, prevent landing, is airport is full?

Objects  | Messages
------------- | -------------
air traffic controller  |  
airport  | prevent landing, is airport full?

is airport full? < > true/false? < > prevent landing

6. **Story 6**
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

nouns: system designer, default airport capacity
verbs: overridden as appropriate

Objects  | Messages
------------- | -------------
system designer  |  
default airport capacity | overridden as appropriate

default airport capacity > overide capacity
