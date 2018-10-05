require 'airport'
require 'weather'

describe Airport do

  it "prevents takeoff when weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    allow(Weather).to receive(:stormy?) { true }
    expect { plane.takeoff }.to raise_error "Airport is closed due to weather conditions"
  end

end
