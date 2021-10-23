# require_relative '../lib/airport.rb'
require 'airport'

describe Airport do
   
  # first test for first user story
  it 'lands a plane' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
   
  it 'allows plane to take off' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end


end
