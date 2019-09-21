# My Methodology

Reading the user stories gave me the following objects / messages:

| Object  | Message         |
|---------|-----------------|
| Plane   | Land            |
| Plane   | Takeoff         |
| Airport | full            |
| weather | prevent takeoff |
| weather | prevent landing |

From here I started feature testing how planes and airports would interact in **IRB**. I found 
that I preferred telling planes to land and specifying the airport (e.g. `plane.land(airport)`)
due to the wording of the user stories:

-  "I want to instruct a plane to land at an airport"
-  "I want to instruct a plane to take off from an airport..."

However this raised the question of how an airport would check whether it was `full?`
I settled on a solution that mimics real life, where the plane will `request_landing` and `request_takeoff` from an airport, and if granted the airport calls a private `move_to_hangar` method on itself. This allows the airport to handle its hangar privately without exposing it to the plane/user beyond the `full?` method.

When deciding on a way to handle weather, I thought it made most sense for an airport to have a specific instance of Weather to reference, rather than every airport referencing the same instance. This meant I would instantiate Airports with a weather parameter (`Airport.new(Weather.new)`) and that would be added to the airports local `@weather` variable.

I created a `sunny?` method on the weather class that would randomly return `true` or `false`. This allowed the `request_landing` and `request_takeoff` methods to call `@wather.sunny?` to determine whether to approve landing or takeoff. 

After looking at the airport methods through the SRP, I refactored `@weather.sunny?` and `full?` into private methods that are called as one unit through a new `safe?` method. This made the plane landing / takeoff logic look like this:
```ruby
plane.land(airport)
	airport.request_landing(plane)
		safe?
			full? => true
			@weather.sunny? => true
		=> true
	update_hangar(plane)
	=> :granted
=> @current_airport = airport
```

This logic allows planes to refuse takeoff from airports they are not landed at by checking their `@current_airport` variable.

To implement a configurable airport capacity I changed the instantiation parameter required to create an Airport to a hash:
```ruby
	Airport.new({ weather: Weather.new, capacity: Integer })
```
This allowed me to assign a `DEFAULT_CAPACITY` if the `capacity:` value was nil and have/use dependency injection for the Weather instance used by the airport.

Overall I think I may have overcomplicated the plane / airport relationship, but feel it still adheres to good SRP and Encapsulation principles as neither class alters the state of another directly. 
                
