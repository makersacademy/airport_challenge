require_relative '../lib/airport_challenge.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:plane2) { double :plane2 }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'allows planes to land in sunny weather' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to eq [plane]
    end

    it 'does not allow planes to land in stormy weather' do
      # @weather == :stormy
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }. to raise_error 'Weather warning. Cannot land.'
    end

    it 'prevents planes from landing when airport is full' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Sorry we are full'
    end
  end

  describe '#take_off' do

    it 'allows planes to take off from airport' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq []
    end

    it 'prevents take off when weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      # @weather == :stormy
      expect { subject.take_off(plane) }. to raise_error 'Weather warning. Cannot take-off.'
    end

    it 'keeps remaining planes at airport when plane leaves' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      subject.land(plane2)
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.take_off(plane)).to eq [plane2]
    end

  end

end
