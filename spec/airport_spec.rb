require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#initialize' do
    it 'sets the default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'allows the default capacity to be overwritten'
  end

  describe '#land(plane)' do
    it 'allows a plane to land' do
      plane = double :plane
      allow(plane).to receive(:land)
      subject.land(plane)
    end
    it 'holds planes after landing' do
      plane = double :plane
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.land(plane)).to include plane
    end
    it 'prevents landing when full' do
      Airport::DEFAULT_CAPACITY.times { subject.land double :plane}
      expect { subject.land double(:plane) }.to raise_error 'Airport full'
    end
  end

  describe '#take_off' do
    it 'sends a message when plane is no longer in airport' do
    plane = double(:plane)
    allow(plane).to receive(:left?)
    subject.land(plane)
    subject.take_off
    expect(subject.all_planes).not_to include plane
  end
end


end
