# Airport Challenge User Stories
describe 'user stories' do
# User Story 1
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

it 'instructs plane to land at airport' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
end

# User Story 2
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

it 'instructs a plane to take off and confirms the departure' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    expect { airport.take_off(plane) }.not_to raise_error
    expect { airport.take_off(plane) }.to output("Take-off: Successful\n").to_stdout
end

# User Story 3
# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

it 'prevents plane taking off if weather is stormy' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?) { true }
    expect { airport.take_off(plane) }.to raise_error 'Cannot take-off: Weather is stormy'
end
it "doesn't prevent plane taking off if weather is not stormy" do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    expect { airport.take_off(plane) }.not_to raise_error
end

# User Story 4
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

it 'prevents plane landing if weather is stormy' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error 'Cannot land: Weather is stormy'
end
it "doesn't prevent plane landing if weather is not stormy" do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
end

# User Story 5
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

it 'prevents landing when airport capacity is exceeded' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    20.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'Cannot land: Airport is full'
end

# User story 6
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

it 'allows a default airport capacity to be overidden to 2' do
    expect(Airport.new(2).capacity).to eq 2
end
it 'allows a default airport capacity to be overidden to 5' do
    expect(Airport.new(5).capacity).to eq 5
end

# Extra cases and edge cases


end