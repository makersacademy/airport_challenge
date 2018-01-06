require 'airport'

describe Airport do

  it { is_expected.to respond_to :take_off }

  describe '#take_off' do
      it 'raises an error when there are no planes available' do
      expect { subject.take_off }.to raise_error 'No planes available'
    end
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to :planes }

  describe '#land' do
    it 'raises an error when full' do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport full'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
  subject { Airport.new }
  let(:plane) { Plane.new }
  it 'defaults capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.land(plane)
    end
    expect{ subject.land(plane) }.to raise_error 'Airport full'
  end
end
end
