#As an air traffic controller
#So I can get passengers to a destination
#I want to instruct a plane to land at an airport


it 'so passengers get to destination, instruct a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
end

=begin
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and
confirm that it is no longer in the airport
=end

it 'so passengers on their way to destination, instruct a plane to take off, confirm no longer at the airport' do
  airport = Airport.new
  plane = Plane.new
  expect { airport.take_off(plane) }.not_to raise_error
end


=begin
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
=end

it 'ensure safety, prevent takeoff when weather is stormy'
  airport = Airport.new
  plane
end



=begin
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

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

=end 
