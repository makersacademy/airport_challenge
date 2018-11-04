require 'plane'
require 'airport'

describe Plane do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { double(:weather) }

  it "plane responds to #land" do
    expect(subject).to respond_to(:land)
  end

  it "can #land at an airport" do
    airport.weather = "sunny"
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
    airport.weather = "sunny"
    plane.land(airport)
    expect { plane.take_off(airport) }.to output("Taking off and no longer in airport\n").to_stdout
  end

  it "can prevent takeoff when weather is stormy" do
    airport.weather = "stormy"
    plane.land(airport)
    expect { plane.take_off(airport) }.to output("Stopped take off due to weather\n").to_stdout
  end

  it "prevents plane from taking off in airport they are not in" do
    
    airport1 = Airport.new
    airport2 = Airport.new
    plane1 = Plane.new
    plane.land(airport1)

    expect{ plane1.take_off(airport1) }.to output("Can't take off from this airport\n").to_stdout

  end

  it "can prevent landing when weather is stormy" do
    airport.weather = "stormy"
    plane.land(airport)
    expect { plane.land(airport) }.to output("Stopped landing\n").to_stdout
  end

  it "prevents #land when airport is full" do
    50.times { Plane.new.land(airport) }
    expect(airport.planes.length).to be <= 20
  end

  it "has a default capacity of 20 planes" do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end

end
