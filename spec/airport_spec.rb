require 'spec_helper'
require 'airport.rb'
require 'plane.rb'

describe Airport do
  it 'lands planes' do
    airport = Airport.new

    plane = Plane.new
    airport.land(plane)

    # doesn't work... not sure why
    expect(airport.planes).to eq(plane)
  end

  it 'takes off plane' do
    airport = Airport.new
    airport.land(Plane.new)

    airport.take_off
    expect(airport.planes).to be_empty
  end

  it 'fail when airport is full' do
    airport = Airport.new

    airport.land(Plane.new)
    airport.land(Plane.new)
    airport.land(Plane.new)
    airport.land(Plane.new)
    airport.land(Plane.new)
    airport.land(Plane.new)
    airport.land(Plane.new)
    airport.land(Plane.new)
    airport.land(Plane.new)
    airport.land(Plane.new)
    airport.land(Plane.new) # ...

    expect {
      airport.land(Plane.new)
    }.to raise_error
  end
end