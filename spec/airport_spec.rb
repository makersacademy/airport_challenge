require 'airport.rb'

describe Airport do
  airport = Airport.new

  it 'plane can land and get stored in hanger' do
    plane = Plane.new
    allow(airport).to receive(:weather) { "sunny" }
    airport.land(plane)
    expect(airport.hanger).to include(plane)
  end

  it 'take off plane from airport and confirm plane is not in hanger' do
    plane = Plane.new
    allow(airport).to receive(:weather) { "sunny" }
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.hanger).not_to include(plane)
  end

  context 'when weather is stormy' do

    it 'raises error if trying to take off' do
      plane = Plane.new
      allow(airport).to receive(:weather) { "stormy" }
      expect { airport.takeoff(plane) }.to raise_error("Can't take off because it's stormy")
    end

    it 'raises error if trying to land' do
      plane = Plane.new
      allow(airport).to receive(:weather) { "stormy" }
      expect { airport.land(plane) }.to raise_error("Can't land because it's stormy")
    end

  end

end
