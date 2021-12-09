require 'airport'
require 'plane'

describe Airport do

  context 'plane can land and take off' do
  # User story:
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
    describe 'land_plane' do
      it 'returns true when a plane has been instructed to land' do
        airport = Airport.new
        plane = Plane.new
        airport.land_plane(plane)
        expect(airport.plane_landed?(plane)).to be true
      end
    end
  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    describe 'take_off' do
      it 'instructs a plane to take off' do
        airport = Airport.new
        plane = Plane.new
        expect(airport.take_off(plane)).to eq plane
      end
    end

    describe 'plane_landed' do
      it 'returns false if there is no plane at the airport' do
        airport = Airport.new
        plane = Plane.new
        expect(airport.plane_landed?(plane)).to eq false
      end
    end
  end
  context 'airport capacity' do
  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when the airport is full
    describe 'prevent landing' do
      it 'prevents plane from landing if airport is full by using a default capacity' do
        airport = Airport.new
        expect(airport.capacity).to eq(10)
      end
    end

    describe 'override' do
      it 'allows default capacity to be overridden' do
        airport = Airport.new
        expect(airport.capacity).to eq(10)
      end
      it 'can add more than ten planes' do
        airport = Airport.new(1)
        expect(airport.capacity).to eq(1)
        plane = Plane.new
        airport.land_plane(plane)
        plane_two = Plane.new
        error_message = 'Landing is not possible as the airport capacity is full'
        expect { airport.land_plane(plane_two) }.to raise_error error_message
      end
    end
  end
end
  