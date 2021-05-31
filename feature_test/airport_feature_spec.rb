#require "./lib/airport.rb"
require './lib/plane.rb'
require './lib/airport.rb'

describe 'User Stories' do

  it 'so planes can land, instruct plane to land' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'innstruct planes to take off' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  it 'prevents landing if airport is full' do
    airport = Airport.new(20)
    plane = Plane.new
    20.times do  
      Airport.land(:plane) 
    end
    expect { airport.land(:plane) }.to raise_error "Cannot land plane, Airport full."

  end
end