require 'airport'

describe Airport do

  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'has a default capacity' do
    expect(subject.airport_capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { Airport.new }
    let(:plane) { double :plane }

    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect{ subject.land(plane) }.to raise_error 'airport is full'
    end
  end
end
