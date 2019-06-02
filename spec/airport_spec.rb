require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do

  describe '#land_plane and #takeoff' do
    it 'allows planes to land' do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end

    it 'allows planes to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'gives error when airport is full' do
      airport = Airport.new
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { subject.land_plane(Plane.new) }
      expect { subject.land_plane(Plane.new) }.to raise_error "airport is full"
    end

  end

  describe '#weather' do
    it 'can land if it is not stormy' do
      allow(subject).to receive(:stormy).and_return false
    end
    it 'cannot land if it is stormy' do
      allow(subject).to receive(:stormy).and_return true
    end
  end
end
