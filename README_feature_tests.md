
#I want to create my objects , plane and airport

airport = Airport.new
plane = Plane.new

# I Want to land the plane and confirm that is
#landed

airport.land(plane)

#If the weather is stormy landing will be canceled
airport.land p => The flight is canceled due to stormy weather

# I want to check if the airport is at his maximum capacity

10.times { airport.land(plane)}

#I  want to departure the plane and conform
# that he left the airport

airport.takeoff(plane)

#If the weather is stormy the flight leaving airport will be canceled

airport.takeoff => The flight is canceled due to stormy weather

#I initiated a default capacity for the airport

DEFAULT_CAPACITY = 10
