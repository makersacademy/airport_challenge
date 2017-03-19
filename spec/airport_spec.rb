require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double :plane}

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land(plane)' do
    it 'signals a plane to land' do
      plane = double :plane
      allow(plane).to receive(:land)
      subject.land(plane)
    end
    it 'holds planes after landing' do
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.land(plane)).to include plane
    end
    it 'prevents landing when full' do
      Airport::DEFAULT_CAPACITY.times { subject.land double :plane}
      expect { subject.land double(:plane) }.to raise_error 'Airport full'
    end
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
  end


end
