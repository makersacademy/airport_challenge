require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  let(:plane) {double(:plane)}
  before{allow(plane).to receive(:landed).and_return(true)}

  TEST_CAPACITY = 20
  NEW_CAPACITY = 15

  describe '#initialize' do
    it 'starts with no planes' do
      expect(airport.planes_in_airport).to be_empty
    end

    it 'starts airport with number of planes' do
      expect(airport.capacity).to eq TEST_CAPACITY
    end

    it  'allow the capacity to be changed' do
      airport = Airport.new(NEW_CAPACITY)
      expect(airport.capacity).to eq NEW_CAPACITY
    end

    it 'has a default capacity' do
      expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
    end
  end

  describe '#land' do
    before(:each) do
      allow(airport).to receive(:bad_weather?).and_return(false)
    end
    context 'good weather' do
      it 'stores plane in an airport' do
        airport.allow_land(plane)
        expect(airport.planes_in_airport).to include plane
      end

      it 'does not allow plane to land if full' do
        allow(airport).to receive(:airport_has?).and_return(false)
        error_message = "Airport is full, cannot land"
        20.times{airport.allow_land(plane) }
        expect{airport.allow_land(plane)}.to raise_error(error_message)
      end

      it 'does not land plane if already in airport' do
        error_message = "Plane already at airport"
        airport.allow_land(plane)
        expect{airport.allow_land(plane)}.to raise_error(error_message)
      end
    end

    context 'bad weather' do
      before{allow(airport).to receive(:bad_weather?).and_return(true)}
      it 'does not let plane land in stormy weather' do
        error_message = 'Too stormy to land'
        expect{airport.allow_land(plane)}.to raise_error(error_message)
      end
    end
end

  describe '#take_off' do
    before(:each) do
      allow(plane).to receive(:at_airport?).and_return(true)
      allow(plane).to receive(:taken_off).and_return(true)
    end

    it 'raises error if plane is not at airport' do
      allow(plane).to receive(:at_airport?).and_return(false)
      error_message = 'Plane not at airport'
      expect {airport.allow_take_off(plane)}.to raise_error(error_message)
    end

    context 'good weather' do
      before(:each) do
        allow(airport).to receive(:bad_weather?).and_return(false)
      end

      it 'removes plane from airport' do
        airport.allow_land(plane)
        airport.allow_take_off(plane)
        expect(airport.planes_in_airport).not_to include plane
      end
    end

    context 'bad weather' do
      before(:each) do
        allow(airport).to receive(:bad_weather?).and_return(true)
      end

      it 'plane not allowed to take off' do
        allow(airport).to receive(:allow_land).with(plane).and_return([plane])
        error_message = "Too stormy to fly"
        expect {airport.allow_take_off(plane)}.to raise_error(error_message)
      end
    end
  end
end
