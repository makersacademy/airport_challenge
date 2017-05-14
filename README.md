# Airport Challenge

[![Build Status](https://travis-ci.org/charlottebrf/airport_challenge.svg?branch=master)](https://travis-ci.org/charlottebrf/airport_challenge)

I took the following approach when solving the Airport Challenge:

- I started by drawing Domain Models for the User Stories
- Tests & doubles: When I began with just 2 classes I first wrote the code without doubles to have clarity on code. As the complexity increased when I added the Weather Station I then found value in doubles & refactored my tests.
- Plane: I then began with the Plane spec & class, I knew that I would need to decide the starting flight status of the plane. I decided planes would be initialized as flying.
- Plane: I added further taken_off?, landed? & flying? methods so I could check the flight status as a boolean condition against the Airport class which changes a plane's status depending on if they've landed or taken off.
- Airport: land & takeoff methods begin with if statements to only land or takeoff a plane under the correct conditions given in the user stories. They raise errors if planes can't land or takeoff.
- Airport: They also store the plane in landed_planes if successfully landed & delete them once they've taken off. We can check how many planes are present? in the airport.
- Airport: Aimed to separate out into methods as much as possible to ensure encapsulation.
- Weather Station: This was the most challenging part. Realising that rand method is an instance of Random class helped me to work out how to use this in the class & effectively in the doubles/ stubs.
- Airport: Has a 'boutique' MAX_CAPACITY of 10, but can be overriden by controller to be a different number.
- Query: Aimed to satisy as many edge case tests as possible. However, wasn't 100% sure I had satisfied the edgecase "that planes can only take off from airports they are in".
