require 'airport'
require 'plane'

RSpec.describe Airport do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  describe '#land' do
    it 'Instruct a plane to land' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end
  end



  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer

  describe '#take_off' do
    it 'Instruct a plane to take off' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.take_off(plane)).to eq plane
    end
  end



  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  describe '#full' do
    it 'Prevent landing, if full' do
      expect(airport.land(plane)).to raise_error('Airport full')
      # need to set a capcity in an airport
      # def a method when capcity is met, raise_error
    end
  end
end
