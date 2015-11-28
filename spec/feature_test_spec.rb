require 'airport'
require 'weather'

describe 'FEATURE TESTS' do

  describe 'Airport feature tests' do
    let(:airport) {Airport.new}
    let(:plane) {Plane.new}

    it 'allows planes to land and confirms that they are landed' do
      allow(Weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(plane.status).to eq :on_the_ground
    end

    it 'allows planes to take off and confirm they are no longer in the airport' do
      allow(Weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.status).to eq :in_the_air
    end

    it 'prevents planes from taking off if stormy' do
      allow(Weather).to receive(:stormy?).and_return(true)
      message = "Can't take off in storm"
      expect{airport.take_off(plane)}.to raise_error message
    end

    it 'prevents planes from landing if stormy' do
      allow(Weather).to receive(:stormy?).and_return(true)
      message = "Can't land in storm"
      expect{airport.land(plane)}.to raise_error message
    end

    it 'prevents landing when the airport is full' do
      allow(plane).to receive(:status).and_return(:in_the_air)
      allow(Weather).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times{airport.land(plane)}
      message = "Can't land, the airport is full"
      expect {airport.land(plane)}.to raise_error message
    end

    it 'has a default capacity ' do
      allow(plane).to receive(:status).and_return(:in_the_air)
      allow(Weather).to receive(:stormy?).and_return(false)
      expect(airport.capacity).to eq 100
      100.times{airport.land(plane)}
      message = "Can't land, the airport is full"
      expect{airport.land(plane)}.to raise_error message
    end

    it 'it\'s default capacity can be overridden' do
      allow(plane).to receive(:status).and_return(:in_the_air)
      allow(Weather).to receive(:stormy?).and_return(false)
      airport.update_capacity(150)
      150.times{airport.land(plane)}
      message = "Can't land, the airport is full"
      expect{airport.land(plane)}.to raise_error message
    end

    end

    end
