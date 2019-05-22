Possible objects
Plane
Air traffic controller
Passenger
Destination
Definite objects
Airport - land, take_off, planes, is_full? - DONE as condition, default_capacity when creating the airport, capacity (variable?)
Weather - current_weather

Other possible methods
plane_at_airport? - DONE through an attribute reader
Maybe this is something more like weather_safe? can_land?, can_take_off? - DONE as conditions within land and take off

Broken down:
Can I create an airport? - DONE
Can I land a plane at the airport? - DONE
Can I see the plane that I landed is at the airport? - DONE
Can I see that no planes are at the airport? - DONE
Can I make a plane take off? - DONE
Can I throw an error if I try to make a plane take off that doesn't exist? - DONE
Can I confirm that the plane has taken off and is no longer in the airport? - DONE
Can I check the weather? - DONE
Can I prevent landing when the weather is stormy? - DONE
Can I prevent takeoff when the weather is stormy? - DONE
Can I create an airport with a default capacity? - DONE
Can I check the current capacity of the airport? - DONE
Can I check whether the airport is already full of planes? - DONE
Can I prevent landing when the airport is already full? - DONE
Can I create airports with different capacities? - DONE
Can I land multiple planes at the airport? - DONE
Can I make multiple planes take off? - DONE
Can I prevent a plane that has already landed from landing again? - DONE

Allow either last plane to take off or given plane to take off? - HAVE ALLOWED GIVEN PLANE TO TAKE OFF
Can I make multiple planes take off in the order they arrived? - NOT SURE THIS IS REQUIRED?

Things to think about
Naming conventions of methods - does it make sense when calling the method? - CHECKED
Methods should only do one thing - have I refactored my code to ensure that each method only does one thing?
Extract further classes - are there any classes I could extract further to make this simpler? - DONE - created weather class
E.g. weather - should it be it's own class? Weather could then have methods for Stormy? and Sunny?
    Would need to look up how to create methods like this
Do I need a method specifically for checking whether a plane is in the airport or is airport.plane_list ok? - DON'T think this is required, airport.plane_list is simple implementation
Could the land method call something that says "safe to land?" - and put all the error handling in that? - UNSURE


Look at the edge cases!
planes can only take off from airports they are in  - DONE
planes that are already flying cannot takes off and/or be in an airport - COVERED BY OTHER TESTS? I AM NOT TRACKING ALL FLYING PLANES
planes that are landed cannot land again and must be in an airport - DONE

MUST DO:
Update the readme - can we cover that final line of code to make sure we do sometimes get stormy?
Try to write a feature test
Read the code reviews pill
Submit the pull request
