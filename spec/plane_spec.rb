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
    expect { plane.take_off(airport) }.to output("Taking off and no longer in airport\n").to_stdout
  end

  it "can prevent takeoff when weather is stormy" do
    airport.weather = false
    expect { plane.take_off(airport) }.to output("Stopped take off due to weather\n").to_stdout
  end

  it "can prevent landing when weather is stormy" do
    airport.weather = false
    expect { plane.land(airport) }.to output("Stopped landing due to weather\n").to_stdout
  end

  it "prevents #land when airport is full" do
    expect(50.times { airport.planes << plane }).to output("Plane is full\n").to_stdout
  end

end
