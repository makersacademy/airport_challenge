
require "airport.rb"

describe Airport do

  describe 'land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'can land a plane and add it to the hangar' do
      plane = 'spitfire'
      subject.land(plane)
      expect(subject.hangar).to eq ([plane])
    end

    it 'prevents landing when weather is stormy' do
      weather_double = double :true
      expect{ subject.land 'spitfire' weather_double } .to raise_error 'Cannot land: Stormzy'
    end
  end

  describe 'take off' do
    it { is_expected.to respond_to(:takeoff) }

    it 'can release a plane from the hanagar' do
    subject.land('spitfire')
    subject.takeoff
    expect(subject.hangar).to eq([])
  end

    it 'prevents take off when weather is stormy' do
    end
  end

  describe 'hangar' do
    it { is_expected.to respond_to(:hangar) }

    it 'confirms that hangar is created as empty array' do
      expect(subject.hangar).to eq([])
    end
  end

  describe 'capacity' do
    it 'returns an error when hangar is full' do
      Airport::DEFAULT_AIRPORT_CAPACITY.times { subject.land 'spitfire' }
      expect { subject.land 'spitfire' }.to raise_error 'Airport full'
    end
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_AIRPORT_CAPACITY
    end
    it 'has a variable capacity' do
      airport = Airport.new(99)
      99.times { airport.land 'spitfire' }
      expect{ airport.land 'spitfire' }.to raise_error 'Airport full'
    end
  end
end
