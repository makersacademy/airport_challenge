require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:flying_plane) { instance_double "Plane", flying?: true }
  let(:landed_plane) { instance_double "Plane", flying?: false }

  describe '#land' do
    it 'lands a plane' do
      expect(subject).to receive(:stormy?).and_return(false)
      allow(flying_plane).to receive(:land)
      expect(subject.land(flying_plane)).to include landed_plane
    end

    it 'does not land if weather is stormy' do
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(flying_plane) }.to raise_error 'cannot land due to stormy conditions'
    end

    it 'prevents landing when airport is full' do
      Airport::DEFAULT_CAPACITY.times do
        expect(subject).to receive(:stormy?).and_return(false)
        allow(flying_plane).to receive(:land)
        subject.land(flying_plane)
      end
      expect { subject.land(flying_plane) }.to raise_error 'cannot land as the airport is full'
    end

    it 'raises error if plane already landed' do

    end

  end

  describe '#take_off' do

    it 'instructs a plane to take off' do
      expect(subject).to receive(:stormy?).and_return(false)
      allow(flying_plane).to receive(:land)
      subject.land(flying_plane)
      expect(subject).to receive(:stormy?).and_return(false)
      allow(landed_plane).to receive(:take_off)
      expect(subject.take_off(landed_plane)).to_not include landed_plane
    end

    it 'does not take off if weather is stormy' do
      expect(subject).to receive(:stormy?).and_return(false)
      allow(flying_plane).to receive(:land)
      subject.land(flying_plane)
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off(landed_plane) }.to raise_error 'cannot take off due to stormy conditions'
    end

    it 'does not take off if airport is empty' do
      expect { subject.take_off(landed_plane) }.to raise_error 'no planes at airport'
    end

    it 'does not take off if plane is flying' do
      expect(subject).to receive(:stormy?).and_return(false)
      allow(flying_plane).to receive(:land)
      subject.land(flying_plane)
      allow(flying_plane).to receive(:take_off)
      expect { subject.take_off(flying_plane) }.to raise_error 'plane already flying'
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
