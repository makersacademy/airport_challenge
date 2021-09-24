# Airport Challenge

## Intro

Welcome to my airport simulator. I have designed this Ruby application as the MVP for the back-end of an airport management app/game. The application can be run through the use of IRB, it has 100% code coverage and functionality that meets all the requested user stories. The current features include the creation of planes and airports, each with customisable settings.

A plane can land at any airport (provided the weather is acceptable), once it is managed by an airport it may take off again (weather permitting). There are checks to make sure that a plane that has landed cannot land again, as well as checks to make sure that a plane that has requested to take-off is currently at the given airport.

Useful methods:

| Class            | Method                        | use                                                                                                                                        |
| ---------------- | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Aeroplane        | :describe                     | Will return a description of the plane, name, id and passenger capacity                                                                    |
| AeroplaneFactroy | :build                        | Will build a new plane with a default passenger capacity, a random name and a random ID (Static method)                                    |
|                  | :build_with_capacity          | Will build a new plane with a custom capacity passed as the first argument (Static method)                                                 |
|                  | :build_with_custom_name       | Will build a new plane with a custom name passed as the first argument (Static method)                                                     |
|                  | :build_with_name_and_capacity | Will build a new plane with a custom name and capacity                                                                                     |
| Airport          | :land_plane                   | Will attempt the land the plane passed as the first parameter (will throw if not a Aeroplane class)                                        |
|                  | :take_off                     | Will attempt to fly the plane passed as the first parameter - given it is currently stored in the airport instance the method is called on |
|                  | :view_planes_at_terminal      | Will return an array holding the IDs of the planes currently at the airport                                                                |

To-Dos

- Create a plane management service to keep track on which planes are where.
- Clean up the README
- Refactor the Airport class. Within the scope of this task I think it is ok, but I think I could extract the class out to seperate services to manage different aspects of the airport. This would make it easier to read and resue elsewhere.

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
