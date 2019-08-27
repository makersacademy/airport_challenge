require_relative "../lib/airport"

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe '#capacity' do
    it 'Airport capacity can be modified' do
      airport = Airport.new(4)
      expect(airport.capacity). to eq 4
    end
  end

  describe '#receive_plane' do
    it "stores plane in the hanger" do
      allow(airport).to receive(:condition?) { true }
      airport.receive_plane(plane)
      expect(airport.hanger).to eq [plane]
    end

    it 'raises an error if weather not clear to land' do
      allow(airport).to receive(:condition?) { false }
      expect { airport.receive_plane(plane) }. to raise_error 'Conditions not safe to land'
    end
  end

  describe '#full?' do
    it 'raises an error when hanger is full' do
      allow(airport).to receive(:condition?) { true }
      airport.capacity.times { airport.receive_plane(plane) }
      expect { airport.receive_plane(plane) }.to raise_error 'Airport full'
    end
  end

  describe '#release_plane' do
    it 'releases plane so no longer in the hanger' do
      allow(airport).to receive(:condition?) { true }
      plane.land(airport)
      airport.release_plane(plane)
      expect(airport.hanger).to eq []
    end

    it 'raises error if weather is not clear to fly' do
      allow(airport).to receive(:condition?) { false }
      expect { airport.release_plane(plane) }.to raise_error 'Weather bad, no fly zone'
    end

    it 'error raised if plane not in the hanger' do
      allow(airport).to receive(:condition?) { true }
      expect { airport.release_plane(plane) }.to raise_error 'Plane not in the hanger'
    end
  end
end
