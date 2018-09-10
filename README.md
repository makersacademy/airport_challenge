# Airport Challenge - weekend 1

## Setup

- Fork
- In Terminal: Clone using : git clone git@github.com:YOURNAME/airport_challenge.git
- In Terminal: bundle

## Using Airport.rb

- To create a new airport:  
```
name_of_airport = Airport.new("Name_Of_Airport", optional_capacity)
```

- To create a new plane:

```
name_of_plane = Plane.new("flight_num", "destination")
```
Once you have an Airport and a Plane you can:

(based on if you have made an instance of an Airport called gatwick (gatwick = Airport.new("Gatwick", 2)))
(based on if you have made an instance of a Plane called jet (jet = Plane.new("JAP999", "Tokyo")))

- gatwick.instruct_landing(jet)
- gatwick.take_off(jet) (so long as plane is currently in the airport!)

### If the airport is at full capacity it will prevent planes from landing.
### If the weather is stormy (this will be generated at random) it will prevent planes from taking off or landing.
