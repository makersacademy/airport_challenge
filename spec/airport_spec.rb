require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:flying_plane) { instance_double "Plane", flying?: true }
  let(:landed_plane) { instance_double "Plane", flying?: false }
  let(:flying_plane2) { instance_double "Plane", flying?: true }
  let(:landed_plane2) { instance_double "Plane", flying?: false }
  let(:stormy) { instance_double "Weather", stormy?: true }
  let(:fine) { instance_double "Weather", stormy?: false }

  describe '#land' do
    it 'lands a plane' do
      allow(flying_plane).to receive(:land)
      expect(subject.land(flying_plane, fine)).to include flying_plane
    end

    it 'does not land if weather is stormy' do
      expect { subject.land(flying_plane, stormy) }.to raise_error 'cannot land due to stormy conditions'
    end

    it 'prevents landing when airport is full' do
      Airport::DEFAULT_CAPACITY.times do
        allow(flying_plane).to receive(:land)
        subject.planes << landed_plane
      end
      expect { subject.land(flying_plane, fine) }.to raise_error 'cannot land as the airport is full'
    end

    it 'does not land a landed plane' do
      allow(landed_plane).to receive(:land)
      expect { subject.land(landed_plane, fine) }.to raise_error 'plane already landed'
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      subject.planes << landed_plane
      allow(landed_plane).to receive(:take_off)
      expect(subject.take_off(landed_plane, fine)).to_not include landed_plane
    end

    it 'does not take off if weather is stormy' do
      subject.planes << landed_plane
      expect { subject.take_off(landed_plane, stormy) }.to raise_error 'cannot take off due to stormy conditions'
    end

    it 'does not take off if airport is empty' do
      expect { subject.take_off(landed_plane, fine) }.to raise_error 'no planes at airport'
    end

    it 'does not take off if plane is flying' do
      subject.planes << landed_plane
      expect { subject.take_off(flying_plane2, fine) }.to raise_error 'plane not at airport'
    end

    it 'does not take off plane at another airport' do
      airport2 = Airport.new
      subject.planes << landed_plane
      airport2.planes << landed_plane2
      expect { airport2.take_off(landed_plane, fine) }.to raise_error 'plane not at airport'
    end
  end

  describe '#capacity' do
    it 'has a set default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can set a manual capacity' do
      subject.capacity = 5
      expect(subject.capacity).to eq 5
    end
  end
end
