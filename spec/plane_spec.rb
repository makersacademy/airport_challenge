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

  it "plane responds to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "can #take_off from an airport" do
    plane.land(airport)
    plane.take_off(airport)
    expect(airport.planes.include?(plane)).to eq false
  end 

  it "confirms when it has left the airport" do
    plane.land(airport)
    expect{plane.take_off(airport)}.to output("Taking off\n").to_stdout
  end
=begin 
  it "responds to #in_airport?" do
    expect(subject).to respond_to(:in_airport?)
  end
=end

end
