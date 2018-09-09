require 'airport'
require 'plane'
require 'passenger'

describe 'Full airport integration' do
  context 'On a sunny day' do
    it 'A passenger can have the full airport experience' do
      passenger = Passenger.new(true, false)
      plane = Plane.new
      airport = Airport.new
      allow_any_instance_of(Airport).to receive(:stormy?).and_return(false)
      passenger.drop_luggage
      airport.land(plane)
      plane.board(passenger)
      airport.take_off(plane)
      airport.land(plane)
      plane.disembark(passenger)
      passenger.collect_luggage
    end
  end

  context 'On a stormy day' do
    it 'A passenger has a terrible airport experience' do
      passenger = Passenger.new(true, false)
      plane = Plane.new
      airport = Airport.new
      allow_any_instance_of(Airport).to receive(:stormy?) { true }
      passenger.drop_luggage
      expect { airport.land(plane) }.to raise_error('No landing, weather is stormy!')
    end
  end
end
