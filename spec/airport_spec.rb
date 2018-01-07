require 'airport'

describe Airport do

  describe '#take_off' do
    let(:plane) { Plane.new }
    it { is_expected.to respond_to :take_off }
    it 'raises an error when there are no planes available' do
      expect { subject.take_off }.to raise_error 'No planes available'
    end
  end

  describe 'airport capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#land' do
   it { is_expected.to respond_to(:land) }
   it { is_expected.to respond_to(:land).with(1).argument }
   let(:plane) { Plane.new }
     it 'defaults capacity' do
       described_class::DEFAULT_CAPACITY.times do
       subject.land(plane)
       end
    expect{ subject.land(plane) }.to raise_error 'Airport full'
    end
  end

end
