require 'airport'
require 'plane'
require 'weather'

describe Airport do

  it "should be able to land" do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to respond_to :land
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it "should be able to instruct a plane to land" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  it "should be able to instruct a plane to take off" do
    airport = Airport.new
    plane = Plane.new
    airport.takeoff(plane)
    expect(airport).to respond_to :takeoff
  end

  #it "raises error if pilot attempts to land and airport is full" do
    #@planes == 1
   # expect { Airport.new.land Plane.new }.to raise_error
  #end

  it "raise an error when you try to land a plane in a full airport" do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times { airport.land Plane.new } 
    expect { airport.land Plane.new }.to raise_error 'Airport full'
  end

  it "prevents takeoff if weather is stormy" do
      weather ==

  end

end
