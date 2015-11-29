#Airport Challenge ----: [![Build Status](https://travis-ci.org/hibreez/airport_challenge.svg?branch=master)](https://travis-ci.org/hibreez/airport_challenge)

Solution to [airport challenge](https://github.com/makersacademy/airport_challenge).
User stories covered with unit and feature testing using BDD process. 
Uses three classes: `Plane`, `Airport` and `Weather`.

Airport class controls takeoffs and landings, instructing planes to update their status.

e.g.:
`airport.land plane` - the airport will instruct the plane to land if possible, adding it to the plane storeage

triggers:
`plane.land airport` - updating the status of the plane to grounded at that airport

###Object/Messages Table

| Object        | Messages         |
| ------------- | ---------------: |
|               |                  |
| Plane         | land             |
|               | take off         |
|               | at airport?      |
|               |                  |
| Airport/      | instruct land    |
| Controller    | prevent land     |
|               | confirm land     |
|               | instruct takeoff |
|               | prevent takeoff  |
|               | confirm takeoff  |
|               | check full?      |
|               | check weather?   |
|               | default capacity |
|               | set capacity     |
