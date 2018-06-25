require 'airport'

describe Airport do
  describe '#can_land?' do
    context "weather is sunny" do
      let (:sunnyweather) { double(:sunnyweather, :isStormy? => false) }
      let (:subject) { Airport.new(sunnyweather) }
      let (:plane) { double(:plane) }

      it 'returns true if the airport is not full' do
        subject = Airport.new(double :sunnyweather, :isStormy? => false)
        expect(subject.can_takeoff?).to be true
      end
      it 'returns false if airport is full' do
        Airport::DEFAULT_CAPACITY.times{ subject.landing(plane) }
        expect(subject.can_land?).to be false
      end
      it 'returns false if airport has capacity again' do
        Airport::DEFAULT_CAPACITY.times{ subject.landing(plane) }
        subject.takingoff(plane)
        expect(subject.can_land?).to be true
      end
      it 'returns true if airport is not full in big airport' do
        big_airport = Airport.new(sunnyweather, 500)
        499.times{ big_airport.landing(plane) }
        expect(big_airport.can_land?).to be true
      end
      it 'returns false if airport is full in big airport' do
        big_airport = Airport.new(sunnyweather, 500)
        500.times{ big_airport.landing(plane) }
        expect(big_airport.can_land?).to be false
      end
    end
    it 'returns false if weather is stormy' do
      subject = Airport.new(double :stormyweather, :isStormy? => true)
      expect(subject.can_land?).to be false
    end
  end

  describe '#can_takeoff?' do
    it 'returns true in sunny weather' do
      subject = Airport.new(double :sunnyweather, :isStormy? => false)
      expect(subject.can_takeoff?).to be true
    end
    it 'returns false in stormy weather' do
      subject = Airport.new(double :stormyweather, :isStormy? => true)
      expect(subject.can_takeoff?).to be false
    end
  end
end
