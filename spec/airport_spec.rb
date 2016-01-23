require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "can land a plane" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "can have a plane take-off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it "can confirm a plane is no longer in the airport" do
    airport.land(plane)
    airport.take_off(plane)
    expect(plane.landed).to eq false
  end

  it "can't have a plane land twice" do
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error "This plane has already landed."
  end

  it "can't have a plane take-off if it isn't at the airport already" do
    expect { airport.take_off(plane) }.to raise_error "This plane is not at this airport."
  end

  it "can't have a plane take-off twice" do
    airport.land(plane)
    airport.take_off(plane)
    expect { airport.take_off(plane) }.to raise_error "This plane is not at this airport."
  end

  it "can't have a plane landing in more than one place" do
    airport.land(plane)
    airport_2 = Airport.new
    expect { airport_2.land(plane) }.to raise_error "This plane is already landed at another airport."
  end

  it "prevents landing when airport full" do
    10.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "This airport is full"
  end
end