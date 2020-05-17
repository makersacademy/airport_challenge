require 'plane'
require 'airport'

describe Plane do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  it "checks whether a plane has departed" do  
    allow(airport).to receive(:weather) { "sunny" }
    airport.land(subject)
    expect(airport.take_off(subject)).to eq true
  end

  it "should tell a plane to land at an airport" do
    expect(subject).to respond_to(:plane)
  end

  it "should prevent landing if weather is stormy" do
    expect { subject.land(plane) }.to raise_error "Weather stormy, unable to land"
  end

  it "should prevent take-off if weather is stormy" do 
    expect { subject.takeoff(plane) }.to raise_error "Weather stormy, unable to take-off"
  end
end