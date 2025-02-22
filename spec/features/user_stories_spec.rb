
#describe UserStory do
#As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
#----
#it 'so the planes land at airport' do
#airport = Airport.new(20)
#plane  = Plane.new
#expect { airport.land(plane) }.not_to raise_error
#end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
#and confirm that it is no longer in the airport
# it 'planes take off and we instruct the plane to take off' do
#airport = Airport.new(20)
#plane  = Plane.new
#expect { airport.take_off_plane(plane) }.not_to raise_error
#end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
# it 'avoid landing when the airport is ful' do
# airport = Airport.new(20)-- adding capacity at this point to this airport
#plane = Plane.new
#20.times do ---giving the 20 planes with this code
# airport.land_plane(plane)
#end
#expect { airport.land_plane(plane)}.to raise_error ' cannot land, full airport'
#end
#end
