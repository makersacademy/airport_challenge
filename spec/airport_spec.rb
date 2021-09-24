require 'airport'

describe Airport do
  let(:plane) { Plane.new }
  let(:weather) { double :weather } 

  describe '#initialize' do
    it 'should initialize an empty array to store planes' do
      expect(subject.planes).to eq []
    end

    it 'should set the default capicty to 30' do
      expect(subject.capacity).to eq 30
    end 

    it 'should allow the default capicty to  be overridden' do
      large_airport = Airport.new(100)
      expect(large_airport.capacity).to eq 100
    end 
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should allow a plane to land' do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.land(plane)).to eq [plane]
    end

    it 'should prevent landing when airport is full' do
      allow(subject).to receive(:stormy?) { false }
      subject.capacity.times { subject.land double :plane }
      expect { subject.land double :plane }.to raise_error 'Unable to land, the airport is full'
    end

    it 'should prevent landing when stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land double :plane }.to raise_error 'Unable to land due to storm'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'should allow a plane to take off' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'should allow a plane to take off and report plane as not in the airport' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      subject.take_off
      expect(plane).to_not be_landed
    end

    it 'should prevent take off when stormy' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off }.to raise_error 'Unable to take off due to storm'
    end
  end
end
