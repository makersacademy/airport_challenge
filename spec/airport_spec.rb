require 'airport'

describe Airport do

  subject { Airport.new }
  let(:plane) { Plane.new }

  before do
    allow(subject).to receive(:stormy).and_return false
  end
  
  context '#initialize' do

    it 'has a default capacity and it can change' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end
  end

  context '#land' do
    let(:plane) { double :plane }

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'raises an error if airport is full' do
      subject.capacity.times { subject.land double :plane }
      expect { subject.land double :plane }.to raise_error 'Airport is full'
    end

    it 'allows planes to land' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'should return landed planes' do
      subject.land(plane)
      expect(subject.plane).to eq [plane]
    end
  end

  context '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'allows plane to take off' do
      subject.land(plane)
      expect(subject.take_off).to eq(plane)
    end

    it 'return an error if airport is empty' do
      expect { subject.take_off }.to raise_error 'No plane available'
    end
  end
end
