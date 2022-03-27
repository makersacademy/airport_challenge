require_relative '../lib/airport.rb'
# Haven't looked into feature tests yet so just recording irb tests.
# Use the drop-downs and remove hashes from code you wish to try out.
# Please do this one at a time!

airport1 = Airport.new
airport2 = Airport.new
airport3 = Airport.new(2)

plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new

# [X] Plane can land (store plane) & take off (return plane)
  # p airport1.land(plane1)
  # p airport1.take_off(plane1)

# [X] Remove plane from hangar when taking off
  # p airport1.land(plane1)
  # p airport1
  # p airport1.take_off(plane1)
  # p airport1

# [X] Default capacity of 10 planes vs. setting capacity at 2
  # p airport1
  # p airport3

# [X] Error when hangar is full
  # p airport3.land(plane1)
  # p airport3.land(plane2)
  # p airport3.land(plane3)
  
# [X] Error when hangar empty
  # p airport1.take_off(plane1)

# [X] Error if grounded plane tries landing in same airport again
  # p airport1.land(plane1)
  # p airport1.land(plane1)

# [ ] Error if grounded plane tries landing in another airport
  # p airport1.land(plane1)
  # p airport2.land(plane1)

# [X] Planes can only take off from airport they are in
  # p airport1.land(plane1)
  # p airport2.land(plane2)
  # p airport2.take_off(plane1)

# [ ] Landing error if weather is stormy
# [ ] takeoff error if weather is stormy


