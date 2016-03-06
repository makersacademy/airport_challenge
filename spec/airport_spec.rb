require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  
  let (:plane) {double(:plane)}

  describe '#initialize' do
    it 'starts with no planes' do
      expect(subject.planes_in_airport).to be_empty
    end

    it 'starts with a capacity of 20 planes' do
      expect(subject.capacity).to eq 20
    end

    it  'allow the capacity to be changed' do
      airport = Airport.new(15)
      expect(airport.capacity).to eq 15
    end

    it 'has a default capacity' do
      expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
    end
  end

  describe '#land' do
    before(:each) do
      allow(airport).to receive(:bad_weather?).and_return(false)
      allow(plane).to receive(:landed).and_return(true)
    end

    it 'stores plane in an airport' do
      subject.land(plane)
      expect(subject.planes_in_airport).to include plane
    end

    it 'does not let plane land in stormy weather' do
      allow(airport).to receive(:bad_weather?).and_return(true)
      error_message = 'Too stormy to land'
      expect{subject.land(plane)}.to raise_error(error_message)
    end

    it 'does not allow plane to land if full' do
      allow(airport).to receive(:check_plane?).and_return(false)
      error_message = "Airport is full, cannot land"
      20.times{subject.planes_in_airport << plane }
      expect{subject.land(plane)}.to raise_error(error_message)
    end

    it 'does not land plane if already in airport' do
      error_message = "Plane already at airport"
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error(error_message)
    end
  end

  describe '#take_off' do
    before(:each) do
      allow(plane).to receive(:at_airport?).and_return(true)
      allow(plane).to receive(:landed).and_return(true)
      allow(plane).to receive(:taken_off).and_return(true)
    end

    it 'raises error if plane is not at airport' do
      allow(plane).to receive(:at_airport?).and_return(false)
      error_message = 'Plane not at airport'
      expect {subject.take_off(plane)}.to raise_error(error_message)
    end

    context 'good weather' do
      before(:each) do
        allow(airport).to receive(:bad_weather?).and_return(false)
      end

      it 'removes plane from airport' do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes_in_airport).not_to include plane
      end
    end

    context 'bad weather' do
      before do
        allow(airport).to receive(:bad_weather?).and_return(true)
      end

      it 'plane not allowed to take off' do
        allow(airport).to receive(:land).with(plane).and_return([plane])
        error_message = "Too stormy to fly"
        expect {subject.take_off(plane)}.to raise_error(error_message)
      end

      xit 'plane still at airport' do
        # allow(airport).to receive(:bad_weather?).and_return(false)
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes_in_airport).to include plane
      end
    end
  end
end
