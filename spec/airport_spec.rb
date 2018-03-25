require 'airport'
require 'plane'
require 'weather'

describe Airport do

  describe '#plane_land' do

    it 'plane land at an airport' do
      airport = Airport.new
      allow(Kernel).to receive(:rand).with(0..5).and_return(0)
      plane = Plane.new
      expect(airport.plane_land(plane)).to include(plane)
    end

    it 'raises an error that plane is not allowed to land when stormy' do
      airport = Airport.new
      plane = Plane.new
      allow(Kernel).to receive(:rand).with(0..5).and_return(5)
      expect { airport.plane_land(plane) }.to raise_error 'Plane is not allowed to land when stormy'
    end

    it ' raises an error when airport is full' do
      allow(Kernel).to receive(:rand).with(0..5).and_return(0)
      airport = Airport.new(40)
      40.times { airport.plane_land Plane.new }
      expect { airport.plane_land("plane") }.to raise_error 'Airport is full'
    end

  end

  describe '#plane_take_off' do

    it 'plane take off from an airport' do
      airport = Airport.new
      plane = Plane.new
      allow(Kernel).to receive(:rand).with(0..5).and_return(0)
      airport.plane_land(plane)
      allow(Kernel).to receive(:rand).with(0..5).and_return(0)
      expect(airport.plane_take_off(plane)).not_to include(plane)
    end

    it 'raises an error that plane is not allowed to take off when stormy' do
      airport = Airport.new
      plane = Plane.new
      allow(Kernel).to receive(:rand).with(0..5).and_return(5)
      expect { airport.plane_take_off(plane) }.to raise_error 'Plane is not allowed to take off when stormy'
    end

  end
end
