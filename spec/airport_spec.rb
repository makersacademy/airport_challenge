require 'airport'

describe Airport do
  describe '#weather_check'
  it "should raise an error when weather is stormy"
  plane = Plane.new
  airport = Airport.new
  allow(airport).to receive(:weather_check) { false }
  expect { airport.take_off(plane) }.to raise_error("Unsafe conditions, take-off not permitted")
end
end
end
