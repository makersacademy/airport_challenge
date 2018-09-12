require 'airport'
require 'plane'
require 'passenger'
require 'weather'

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

  context 'Testing airport capacity' do
    it 'lets several planes land and take off' do
      planes = []
      airport = Airport.new(30, weather = Weather.new)
      5.times { planes << Plane.new }

      allow(weather).to receive(:stormy?) { false }
      planes.each { |plane| airport.land(plane) }
      planes.each { |plane| airport.take_off(plane) }
    end

    it 'exceeds airport capacity' do
      planes = []
      airport = Airport.new
      20.times { planes << Plane.new }
      allow_any_instance_of(Airport).to receive(:stormy?).and_return(false)
      planes.each { |plane| airport.land(plane) }
      expect { airport.land(Plane.new) }.to raise_error('Airport is full!')
    end
  end

  context 'Testing plane capacity' do
    it 'lets several passenger board and disembark' do
      passengers = []
      20.times { passengers << Passenger.new(true, false) }
      airport = Airport.new
      plane = Plane.new
      allow_any_instance_of(Airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      passengers.each { |passenger| plane.board(passenger) }
      airport.take_off(plane)
      airport.land(plane)
      passengers.each { |passenger| plane.disembark(passenger) }
    end
  end

    it 'exceeds plane capacity' do
      passengers = []
      100.times { passengers << Passenger.new(true, false) }
      plane = Plane.new
      airport = Airport.new
      allow_any_instance_of(Airport).to receive(:stormy?).and_return(false)
      airport.land(plane)
      passengers.each { |passenger| plane.board(passenger) }
      expect { plane.board(Passenger.new) }.to raise_error('Plane is full!')
    end
  end
