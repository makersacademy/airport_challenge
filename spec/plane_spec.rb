require 'plane'
require 'airport'

describe Plane do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "plane responds to #land" do
    expect(subject).to respond_to(:land)
  end

  it "can #land at an airport" do
    plane.land(airport)
    expect(airport.planes.include?(plane)).to eq true
  end

=begin 
  it "plane responds to #take_off" do
    expect(subject).to respond_to(:take_off)
  end
  
  it "responds to #in_airport?" do
    expect(subject).to respond_to(:in_airport?)
  end

  it "can #take_off from an airport" do
    airport.stub(:planes) { false }
    plane.take_off
    expect(airport.planes).to eq false
  end 
=end

end
