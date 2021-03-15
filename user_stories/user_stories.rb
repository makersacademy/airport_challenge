=begin

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

it 'so planes land at airports' do
airport = Airport.new
plane = Plane.new
expect {airport.land(plane)}

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

it 'so planes can take off, instruct a plane to take off from an airport' do 
airport = Airport.new
plane = Plane.new
expect {airport.take_off(plane)}

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
it 'does not allow planes to land when airport is full'
airport = Airport.new(50)
50.times do 
    Airport.land(plane)
end 
expect { airport.land(plane) }.to raise_error 'Cannot land the plane, the airport is full'