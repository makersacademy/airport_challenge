# require 'airport'

shared_examples_for PlaneContainer do

# describe PlaneContainerTest do
  # subject(:Airport) {described_class.new}
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

  # has default capacity
  # describe '#initialize' do
  #   it 'initialize should set default capacity' do
  #     expect(subject.capacity).to eq PlaneContainer::DEFAULT_CAPACITY
  #   end
  # end

  # #instance takes set capacity
  # describe '#initialize' do
  #   it ''
  # end

  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq PlaneContainer::DEFAULT_CAPACITY
  end

end
