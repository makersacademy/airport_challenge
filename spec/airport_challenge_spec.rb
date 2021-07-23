require_relative '../lib/airport_challenge.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:plane2) { double :plane2 }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'allows planes to land in sunny weather' do
      @weather == :sunny
      expect(subject.land(plane)).to eq [plane]
    end

    it 'does not allow planes to land in stormy weather' do
      @weather == :stormy
      expect { subject.land(plane) }. to raise_error 'Weather warning. Cannot land.'
    end

    it 'prevents planes from landing when airport is full' do
      @weather == :sunny
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Sorry we are full'
    end
  end

  describe '#take_off' do

    it 'allows planes to take off from airport' do
      subject.land(plane)
      @weather == :sunny
      expect(subject.take_off(plane)).to eq []
    end

    it 'prevents take off when weather is stormy' do
      @weather == :sunny
      subject.land(plane)
      @weather == :stormy
      expect { subject.take_off(plane) }. to raise_error 'Weather warning. Cannot take-off.'
    end

    it 'keeps remaining planes at airport when plane leaves' do
      @weather == :sunny
      subject.land(plane)
      subject.land(plane2)
      expect(subject.take_off(plane)).to eq [plane2]
    end

  end

end
