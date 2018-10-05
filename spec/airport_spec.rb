require 'airport'
require 'weather'

describe Airport do

  it "prevents takeoff when weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    allow(Weather).to receive(:stormy?) { false }
    plane.land(airport)
    allow(Weather).to receive(:stormy?) { true }
    expect { plane.takeoff }.to raise_error "Airport is closed due to weather conditions"
  end

  it "prevents landing when weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    allow(Weather).to receive(:stormy?) { true }
    expect { plane.land(airport) }.to raise_error "Airport is closed due to weather conditions"
  end

end
