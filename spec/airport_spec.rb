require_relative '../lib/airport'

describe Airport do
  subject(:ap) { described_class.new }
  subject(:plane) { described_class.new }
  describe '#land' do
    it 'lands the plane at the airport with no storms' do
      allow(ap.weather).to receive(:stormy?).and_return false
      expect(ap.land(plane)).to match_array [plane]
    end

    it 'won\'t land due to stormy weather' do
      allow(ap.weather).to receive(:stormy?).and_return true
      expect { ap.land(plane) }.to raise_error 'Bad weather, landing cancelled'
    end

    it 'prevents planes landing when the airport is full' do
      allow(ap.weather).to receive(:stormy?).and_return false
      30.times { ap.land(plane) }
      expect { ap.land(plane) }.to raise_error 'Airport is full, can\'t land'
    end
  end

  describe '#takeoff' do
    it 'lets the plane takeoff from the airport and check it has left' do
      allow(ap.weather).to receive(:stormy?).and_return false
      ap.land(plane)
      ap.takeoff(plane)
      expect(ap.status).to eq "There are 0 planes here"
    end

    it 'won\'t take off due to stormy weather' do
      allow(ap.weather).to receive(:stormy?).and_return false
      ap.land(plane)
      allow(ap.weather).to receive(:stormy?).and_return true
      expect { ap.takeoff(plane) }.to raise_error 'Bad weather, takeoff cancelled'
    end
  end

  describe '#status' do
    it 'returns no planes parked at airport' do
      expect(ap.status).to eq "There are 0 planes here"
    end

    it 'returns one plane at the airport' do
      allow(ap.weather).to receive(:stormy?).and_return false
      ap.land(plane)
      expect(ap.status).to eq "There are 1 planes here"
    end
  end

end
