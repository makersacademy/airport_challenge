# Domain Model
Converting user stories into objects/messages

## User Stories
>As an air traffic controller  
So I can get passengers to a destination  
I want to instruct a plane to land at an airport
>

>As an air traffic controller  
So I can get passengers on the way to their destination  
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
>

>As an air traffic controller  
To ensure safety  
I want to prevent landing when the airport is full
>

>As the system designer  
So that the software can be used for many different airports  
I would like a default airport capacity that can be overridden as appropriate
>

>As an air traffic controller  
To ensure safety  
I want to prevent takeoff when weather is stormy
>

>As an air traffic controller  
To ensure safety  
I want to prevent landing when weather is stormy
>

## Nouns:
- Plane
- Airport
- Weather

## Verbs:
- land
- take off
- is in airport
- is full
- weather is stormy


## Table
| Object  | Messages  |
|---------|-----------|
| Plane   | land      |
|         | take_off  |
| Airport | full?     |
|         | contains? |
|         | stormy?   |
| Weather | change    |
