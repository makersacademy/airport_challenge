#Airport Challenge

A client wants to control the flow of planes at an airport. The following are their agreed user stories:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport and confirm that it has landed 

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

##Task

Create a set of classes/modules to satisfy all the above user stories. 

Create separate files for every class, module and test suite.

Defend against 'edge cases' and system inconsistencies such as instances of the same plane taking off at different airports simultaneously. 

##Design approach

Use of 'object-orientated design' principles:

        | Objects             | Attributes                   | Interactions                                        |
        | :------------------ | :--------------------------- | :-------------------------------------------------- |
        | Airport             | Capacity                     | land, takeoff, prevent_land, prevent_takeoff        |
        | Plane               | Working                      | land, takeoff                                       |
        | Weather             | Sunny, Stormy                | prevent_land, prevent_takeoff                       |
        
3 class objects have been created:
        - The 'Airport' class has a default capacity and monitors the number of planes landing and taking off. Once capacity is reached, it prevents further planes from landing
        - The 'Plane' class can be instructed to takeoff from an airport and land at another airport
        - The 'Weather' class is a randomly generated value that returns 'Sunny' or 'Stormy'. Planes are prevented from landing or taking off in 'Stormy' weather.  

4 methods have been created:
        - 'plane_takeoff' instructs an instance of 'Plane' to takeoff from an airport
        - 'plane_land' instructs an instance of 'Plane' to land at an airport
        - 'prevent_takeoff' stops an instance of 'Plane' from taking off at an airport
        - 'prevent_land' stops an instance of 'Plane' from landing at an airport.
        
##Validation

Example BDD/TDD test: 
```ruby
      describe Airport do #specification
        context 'when sunny' do #context
          it 'lets planes land' do #example
             plane = Plane.new #setup
             subject.land(plane) #execution
             expect(subject.land(plane)).to eq [plane] #expectation
          end
        end
      end
```

##User instructions

- Create a new airport 'new_airport = Airport.new'
- Create a new plane 'new_plane = Plane.new'
- Instruct plane to takeoff from airport 'new_airport.takeoff(plane)'
- Instruct plane to land at airport 'new_airport.land(plane)'

Landing and Takeoff are subject to weather being 'Sunny', aiport capacity being not full and plane status (e.g. plane cannot takeoff if already flying). 

###Author
Tim Tang https://github.com/Tim3tang




