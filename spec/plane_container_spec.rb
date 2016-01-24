# require 'airport'

shared_examples_for PlaneContainer do

# describe PlaneContainerTest do
  subject(:PlaneContainer) {described_class.new}
	let(:plane) { double :plane }
  let(:control) { double :control }

  #responds to methods in module
  it { is_expected.to respond_to(:plane_in).with(1).argument }
  it { is_expected.to respond_to(:plane_out).with(1).argument }

  #logged into module list
  describe '#plane_in' do
    it 'check plane in airport' do
      subject.plane_in(plane)
      expect(subject.list_planes).to include(plane)
    end
  end

  #logged out of module list
  describe '#plane_out' do
    it 'returns plane removed from airport' do
      subject.plane_in(plane)
      expect(subject.plane_out(plane)).to eq plane
    end
  end

  describe '#plane_out' do
    it 'check plane no longer at airport' do
      subject.plane_in(plane)
      subject.plane_out(plane)
      expect(subject.list_planes).not_to include(plane)
    end
  end

  describe '#initialize' do
    it 'has a default capacity when initialized' do
      expect(subject.capacity).to eq subject.class::DEFAULT_CAPACITY
    end
  end

  describe '#initialize' do
    it 'has a set capacity when initialized' do
      random = rand(subject.class::DEFAULT_CAPACITY)
      subject = described_class.new(random)
      expect(subject.capacity).to eq random
    end
  end

  #is full at capacity
  describe 'full?' do
    it 'reaches full at capacity' do
      subject.capacity.times { subject.plane_in(plane) }
      expect(subject.full?).to be true
    end
  end

end
