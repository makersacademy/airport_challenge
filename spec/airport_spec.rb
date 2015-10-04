require 'airport'

describe Airport do

  let(:plane) { double :plane }

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'contains no planes when created' do
    expect(subject.planes).to eq([])
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  describe 'land' do
    it 'instructs a plane to land in the airport' do
      subject.land(plane)
      expect(subject.planes.length).to eq(1)
    end
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe 'take_off' do
    it 'instructs a plane to leave the airport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq([])
    end
  end

  describe 'traffic controller' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather).and_return(:sunny)
        subject.capacity.times { subject.land(plane) }
        expect{ subject.land(plane) }.to raise_error 'Airport is full'
    end
  end

  context 'when airport is empty' do
    it "raises an error 'no planes available'" do
      subject.planes.empty?
      expect{ subject.take_off(plane) }.to raise_error 'No planes at airport'
    end
  end

  context 'when weather conditions are stormy' do
    it 'does not allow a plane to take off' do
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.land(plane)
      allow(subject).to receive(:weather).and_return(:stormy)
      expect { subject.take_off(plane) }.to raise_error 'Stormy weather'
    end
  end

    it 'does not allow a plane to land' do
      allow(subject).to receive(:weather).and_return(:stormy)
      expect { subject.land(plane) }.to raise_error 'Stormy weather'
    end
  end
end
