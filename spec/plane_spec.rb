require 'plane'
require 'airport'

describe Plane do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { double(:weather) }

  it "can .land at an airport" do
    airport.weather = "sunny"
    plane.land(airport)
    expect(airport.planes.include?(plane)).to eq true
  end

  it "responds to .take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "can .take_off from an airport" do
    plane.land(airport)
    plane.take_off(airport)
    expect(airport.planes.include?(plane)).to eq false
  end 

  it "confirms when it has left the airport" do
    airport.weather = "sunny"
    plane.land(airport)
    expect { plane.take_off(airport) }.to output("Taking off and no longer in airport\n").to_stdout
  end

  it "can prevent .take_off when weather is stormy" do
    plane.land(airport)
    airport.weather = "stormy"
    expect { plane.take_off(airport) }.to output("Stopped take off due to weather\n").to_stdout
  end

  it "prevents .take_off when already in flight" do
    airport.weather = "sunny"
    plane.land(airport)
    plane.take_off(airport)
    expect { plane.take_off(airport) }.to output("Already in flight\n").to_stdout
  end

  it "prevents plane from .take_off in airport they are not in" do
    
    airport1 = Airport.new
    airport2 = Airport.new
    plane1 = Plane.new
    airport2.weather = "sunny"
    airport1.weather = "sunny"

    plane1.land(airport1)
    
    expect { plane1.take_off(airport2) }.to output("Can't take off from this airport\n").to_stdout

  end

  it "can prevent landing when weather is stormy" do
    airport.weather = "stormy"
    plane.land(airport)
    expect { plane.land(airport) }.to output("Stopped landing\n").to_stdout
  end

  it "prevents .land when airport is full" do
    50.times { Plane.new.land(airport) }
    expect(airport.planes.length).to be <= 20
  end

  it "has a default capacity of 20 planes" do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end

end
