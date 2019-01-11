require 'airport'

RSpec.describe Airport do

  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport

  it { is_expected.to respond_to(:land) }  

  it { is_expected.to respond_to(:land).with(1).argument }
  
  it "can instruct a plane to land at an airport" do
    plane = Plane.new
    expect(subject.land(plane)).to be_a_kind_of(Array) 
  end

  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "can instruct a plane to take off and confirm that the plane has left the airport" do
    airport = Airport.new
    allow(airport).to receive(:stormy).and_return(false)
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes_in_airport.include?(plane)).to eq(false)
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent takeoff when weather is stormy 

  it "checks if weather is stormy" do
    airport = Airport.new
    allow(airport).to receive(:stormy).and_return(true)
    expect(airport.stormy).to eq(true)
  end

  it "prevents take off when weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    allow(airport).to receive(:stormy).and_return(true)
    expect{ airport.take_off(plane) }.to raise_error("No take offs permitted")
  end

end