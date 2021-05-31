#require "./lib/airport.rb"
require './lib/plane.rb'
require './lib/airport.rb'
require './lib/weather_reporter.rb'

describe 'User Stories' do
  let(:airport) { Airport.new(20, weather_reporter) }
  let(:plane) { Plane.new }
  let(:weather_reporter) { WeatherReporter.new }

  context 'when not stormy' do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return false
    end
      # As an air traffic controller 
      # So I can get passengers to a destination 
      # I want to instruct a plane to land at an airport
    it 'so planes can land, instruct plane to land' do
      expect { airport.land(plane) }.not_to raise_error
    end
    

    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport  
    it 'instruct planes to take off' do
      airport.land(plane)
      expect { airport.take_off(plane) }.not_to raise_error
    end
    
    #takes off a plane only for an airport they are at
    it 'takes off a plane only for an airport they are at' do
      airport_2 = Airport.new(20, WeatherReporter.new)
      airport_2.land(plane)
      expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: plane not at this airport'
    end
    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when the airport is full 
    context 'when airport is full' do
      it 'does not allow planes to land' do
        20.times do  
          airport.land(:plane) 
        end
        expect { airport.land(:plane) }.to raise_error 'Cannot land plane, Airport full.'
      end
    end 
  end 
    
    #     As an air traffic controller 
    # To ensure safety 
    # I want to prevent takeoff when weather is stormy 

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when weather is stormy 
  context 'when stormy' do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return true
    end
    it 'does not allow planes to land' do
      expect { airport.land(:plane) }.to raise_error 'Cannot land plane, weather is stormy.'
    end 
    it 'does not allow planes to take off' do
    expect { airport.take_off(:plane) }.to raise_error 'Cannot take off, weather is stormy.'
    end 
  end
end