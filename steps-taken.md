1. Create local repo and merge it to the remote Github repo

2. Run the command `gem install bundler` (if you don't have bundler already)

3. When the installation completes, run `bundle`

Nouns - Classes 

Verbs - Methods

### First user story
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

Nouns - controller, passengers, plane, airport 

Verbs - instruct, land 



Objects         Messages 
Controller      
Passengers 
Plane           land?
Airport         check if a plane has landed?

irb feature test
- require './lib/airport'
- airport = Airport.new 
- require './lib/plane'
- plane = Plane.new
- airport.land(plane)



</br>

### Second user story
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Nouns - controller, passengers, plane, airport

Verbs -  takeoff

Objects         Messages 

Plane           
Airport         takeoff

</br>


### Third user story
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

Nouns - controller, airport 

Verbs -  prevent landing

Objects         Messages 

Plane           
Airport         full?


</br>

### Fourth user story
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

Nouns - designer, airport

Verbs -  default capacity

</br>

### Fifth user story
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

</br>

### Sixth user story
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 


</br>