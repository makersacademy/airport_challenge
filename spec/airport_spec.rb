require 'airport'
require 'weather'
require 'plane'


describe Airport do
  let(:weather){double('weather')}
  let(:plane_one){double('plane')}
  let(:plane_two){double('plane')}
  subject(:airport){described_class.new(weather)}
  subject(:other_airport){described_class.new(weather, plane_one, 30)}

  describe '#arrivals' do
    it {is_expected.to respond_to(:arrivals)}

    it 'arrival with proper weather' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect(airport.arrivals(plane_one).empty?).to eq(false)
    end

    it 'arrival with stormy weather' do
      allow(weather).to receive(:stormy?) { true }
      error_message = "Bad weather conditions to land"
      expect {airport.arrivals}.to raise_error(error_message)
    end

    it 'does not land if airport full' do
      allow(weather).to receive(:stormy?) { false }
      capacity = airport.capacity
      capacity.times {airport.arrivals}
      error_message = "Airport is full"
      expect {airport.arrivals}.to raise_error(error_message)
    end
  end

  describe '#departures' do
    it {is_expected.to respond_to(:departures)}

    it 'depature with proper weather' do
      allow(weather).to receive(:stormy?) { false }
      airport.arrivals(plane_one)
      airport.departures
      expect(airport.planes).to eq([])
    end

    it 'depature with stormy weater' do
      allow(weather).to receive(:stormy?) { false }
      airport.arrivals(plane_one)
      allow(weather).to receive(:stormy?) { true }
      error_message = "Bad weather conditions to depart"
      expect {airport.departures}.to raise_error(error_message)
    end

    it 'airport empty' do
      error_message = "No planes landed"
      expect {airport.departures}.to raise_error(error_message)
    end
  end

  describe '#planes' do
    it {is_expected.to respond_to(:planes)}
  end

  describe '#capacity' do
    it {is_expected.to respond_to(:capacity)}

    it 'change capacity' do
      expect(other_airport.capacity).to eq(30)
    end
  end
end
