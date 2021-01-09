
## Nouns:
- passengers
- plane
- airport

## Verbs:
- land
- take-off
- confirm no longer in airport
- prevent landing when airport is full
- set a default airport capacity
- prevent landing when weather is stormy
- prevent takeoff when weather is stormy

## Table
|Objects         |Messages      |
|----------------|--------------|
|plane          |land, take-off |
|airport          |prevent landing, prevent takeoff, set default capacity|

## Object/Message Interaction
Passengers --> plane --> takeoff --> landing
Airport --> instruct to take off --> plane --> confirm no longer in airport
Airport --> set default plane capacity
Airport --> weather stormy --> prevent landing
Airport --> weather stormy --> prevent takeoff
