
require "airport.rb"
require "weather.rb"

describe Airport do
let(:bad_weather) {double :weather, forecast: 7 }
let(:good_weather) {double :weather, forecast: 8 }
  describe 'land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'can land a plane and add it to the hangar if not stormy' do
      airport = Airport.new(Airport::DEFAULT_AIRPORT_CAPACITY, good_weather)
      plane = 'spitfire'
      airport.land(plane)
      expect(airport.hangar).to eq ([plane])
    end

    it 'prevents landing when weather is stormy' do
      airport = Airport.new(Airport::DEFAULT_AIRPORT_CAPACITY, bad_weather)
      plane = 'spitfire'
      expect{ airport.land(plane) }.to raise_error('Cannot land: Stormy')
    end
  end

  describe 'take off' do
    it { is_expected.to respond_to(:takeoff) }

    it 'can release a plane from the hanagar' do
      airport = Airport.new(Airport::DEFAULT_AIRPORT_CAPACITY, good_weather)
      plane = 'spitfire'
      airport.land(plane)
      airport.takeoff
      expect(airport.hangar).to eq([])
    end

    it 'prevents take off when weather is stormy' do
      airport = Airport.new(Airport::DEFAULT_AIRPORT_CAPACITY, bad_weather)
      expect{ airport.takeoff }.to raise_error('Cannot take off: Stormy')
    end
  end

  describe '#hangar' do
    it { is_expected.to respond_to(:hangar) }

    it 'confirms that hangar is created as empty array' do
      expect(subject.hangar).to eq([])
    end
  end

  describe '#capacity' do
    it 'returns an error when hangar is full' do
      airport = Airport.new(Airport::DEFAULT_AIRPORT_CAPACITY, good_weather)
      Airport::DEFAULT_AIRPORT_CAPACITY.times { airport.land 'spitfire' }
      expect{ airport.land 'spitfire' }.to raise_error 'Airport full'
    end
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_AIRPORT_CAPACITY
    end
    it 'has a variable capacity' do
      airport = Airport.new(99, good_weather)
      99.times { airport.land 'spitfire' }
      expect{ airport.land 'spitfire' }.to raise_error 'Airport full'
    end
  end
end
