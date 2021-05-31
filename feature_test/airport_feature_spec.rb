#require "./lib/airport.rb"
require './lib/plane.rb'
require './lib/airport.rb'

describe 'User Stories' do
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
  it 'so planes can land, instruct plane to land' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'innstruct planes to take off' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end
  context 'when airport is full' do
    it 'does not allow planes to land' do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return false
      20.times do  
        airport.land(:plane) 
      end
      expect { airport.land(:plane) }.to raise_error 'Cannot land plane, Airport full.'
    end
  end  
    
    #     As an air traffic controller 
    # To ensure safety 
    # I want to prevent takeoff when weather is stormy 

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when weather is stormy 
  context 'when stormy' do
    it 'does not allow planes to land' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(:plane) }.to raise_error 'Cannot land plane, weather is stormy.'
    end 
  end 
end