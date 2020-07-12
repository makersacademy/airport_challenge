describe User_story do
    
#     As an air traffic controller 
#     So I can get passengers to a destination 
it 'instruct a plane to land at an airport' do
plane = Plane.new
airport = Airport.new
expect { airport.land(plane) }.not_to raise_error
end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
it 'instruct a plane to take off from an airport and no longer in the airport' do
    expect { airport.take_off(plane) }.not_to raise_error
end

end