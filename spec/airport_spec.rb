require 'airport.rb'

# User Story 1
describe Plane do

end

describe Airport do

  it 'I want to instruct a plane to land at an airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.total_planes(plane)).to eq true
  end

# User Story 2
  it 'Take-off and confirm that the plane is no longer in the airport' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.total_planes(plane)).to eq false
  end

# User Story 3
it 'I want to prevent takeoff when weather is stormy' do
   airport = Airport.new
   plane = Plane.new
   allow(airport).to receive(:weather) { "stormy" }
   expect { airport.take_off(plane) }.to raise_error "You cannot takeoff. It is too stormy"
 end

# User Story 4
it 'I want to prevent takeoff when weather is stormy' do
   airport = Airport.new
   plane = Plane.new
   allow(airport).to receive(:weather) { "stormy" }
   expect { airport.land(plane) }.to raise_error "You cannot land. It is too stormy"
 end

end
