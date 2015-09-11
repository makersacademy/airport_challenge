require 'airport'

describe Airport do

  let(:plane){ double :plane }

  describe 'take off' do
    it { is_expected.to respond_to :take_off }

    it 'should reduce a plane in the planes array' do
      allow(subject).to receive(:weather).and_return(:sunny)
      subject.land(plane)
      subject.take_off
      expect(subject.planes.count).to eq 0
    end
  end

  describe 'landing' do
    it { is_expected.to respond_to :land }

    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow plane to land' do
        allow(subject).to receive(:weather).and_return(:sunny)
        subject.capacity.times { subject.land(plane) }
        expect{ subject.land(plane) }.to raise_error 'Airport full.'
      end
    end

    context 'when weather conditions are stormy' do
      it 'does not allow plane to take off' do
        allow(subject).to receive(:weather).and_return(:sunny)
        subject.land(plane)
        allow(subject).to receive(:weather).and_return(:stormy)
        subject.weather
        expect{subject.take_off}.to raise_error 'Stormy weather'
      end

      it 'does not allow plane to land' do
        allow(subject).to receive(:weather).and_return(:stormy)
        subject.weather
        expect{subject.land(plane)}.to raise_error 'Stormy weather'
      end
      it 'makes the weather stormy' do
        subject.weather
        expect(subject.weather).to eq(:stormy).or eq(:sunny)
      end
    end
  end
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
end
