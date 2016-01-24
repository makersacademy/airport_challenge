require 'airport'

describe Airport do
  subject(:Airport) {described_class.new}
	let(:plane) { double :plane }
  let(:control) { double :control }

#responds to methods in class
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  #airport has defaul capacity
  describe '#initialize' do
    it 'initialize should set default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  #land docks plane in airport
  describe '#land' do
    it 'check plane in airport' do
      subject.land(plane)
      expect(subject.airport_planes).to include(plane)
    end
  end

  #takeoff releases plane from airport
  describe '#takeoff' do
    it 'returns plane removed from airport' do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end
  end

  describe '#takeoff' do
    it 'check plane no longer at airport' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.airport_planes).not_to include(plane)
    end
  end

end
