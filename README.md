#Airport Challenge [![Build Status](https://travis-ci.org/hibreez/airport_challenge.svg?branch=master)](https://travis-ci.org/hibreez/airport_challenge)

My solution to [airport challenge](https://github.com/makersacademy/airport_challenge).

Uses classes `Plane` and `Airport` and a `Weather` module.  
All user stories covered with unit and feature testing, following BDD process.   
Unit tests are isolated using doubles. 

####Installation  
`git clone git@github.com:hibreez/airport_challenge.git`  
`cd airport_challenge`  
`gem install bundle`  
`bundle`  

####Useage
```ruby
airport = Airport.new       #==> #<Airport:0x007f... @capacity=20, @planes=[]>
airport.stormy?             #==> false
plane = Plane.new           #==> #<Plane:0x007ff84c85fbf0 @flying=true>
airport.land! plane         #==> [#<Plane:0x007... @airport=#<Airport:0x007... @capacity=20, @planes=[...]>, @flying=false>]
plane.flying?               #==> false
```

Airport class controls takeoffs and landings,
instructing planes to update their status accordingly.  
for example:  
`airport.land! plane` - the airport will instruct the plane to land,
if possible, adding it to the plane storage  
triggering:  
`plane.land! airport` - updating the status of the plane to be grounded at the 
airport

Weather module provides method `.stormy?` which returns a boolean
based on a random number.

####Object/Messages Table

| Object        | Messages         |
| ------------- | ---------------: |
|               |                  |
| Plane         | land             |
|               | take off         |
|               | flying?          |
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
|               |                  |
| Weather       | stormy?          |
