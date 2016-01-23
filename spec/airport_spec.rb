require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double(:plane, :landed => false, :landed= => true)}

  #redundant because this method tested in later tests
  #it "can land a plane" do
  #  expect(airport).to respond_to(:land).with(1).argument
  #end

  # redundant because responding to the method take-off is tested in other tests
  #it "can have a plane take-off" do
   # expect(airport).to respond_to(:take_off).with(1).argument
  #end

  #redundant - tested again when testing a plane can't take off twice it "can confirm a plane is no longer in the airport" do
    # airport.land(plane)
    # airport.take_off(plane)
    # not testing airport. just the double expect(plane.landed).to eq false
  #end

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
    allow(plane).to receive(:landed).and_return(true)
    airport_2 = Airport.new
    expect { airport_2.land(plane) }.to raise_error "This plane is already landed at another airport."
  end

  it "prevents landing when airport full" do
    Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "This airport is full"
  end

  #redundant test (with the default capacity constant used above) it "has a default capacity" do
  #  expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  #end

  it "can have capacity set when airport created" do
    airport_2 = Airport.new(15)
    expect(airport_2.capacity).to eq 15
  end

  it "can have capacity overwritten when needed" do
    airport.capacity = 30
    expect(airport.capacity).to eq 30
  end
end