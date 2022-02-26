require 'airport'
require 'plane'

describe Airport do
  it 'creates a new airport object' do
    airport = Airport.new
  end   

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to :take_off }

  describe '#initialization' do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport capacity reached. No more landing allowed.'
    end
  end

  describe '#land' do
    it 'accepts a plane to land' do
      plane = Plane.new
      expect(subject.land(plane).count).to eq 1
    end

    it 'prevents landing when airport is full' do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport capacity reached. No more landing allowed.'
    end
  end

  describe '#take_off' do
    it 'allows plane to take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end
end
