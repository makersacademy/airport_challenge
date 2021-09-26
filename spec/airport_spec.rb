require 'airport'

describe Airport do
  let(:plane) { Plane.new } 

  before do
    allow(subject).to receive(:stormy?) { false }
  end

  describe '#initialize' do
    it 'should initialize an empty array to store planes' do
      expect(subject.planes).to eq []
    end

    it 'should set the default capacity to 30' do
      expect(subject.capacity).to eq 30
    end 

    it 'should allow the default capacity to be overridden' do
      large_airport = Airport.new(100)
      expect(large_airport.capacity).to eq 100
    end 
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should allow a plane to land' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'should prevent landing when airport is full' do
      subject.capacity.times { subject.land double :plane }
      expect { subject.land double :plane }.to raise_error 'Unable to land, the airport is full'
    end

    it 'should prevent landing when stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land double :plane }.to raise_error 'Unable to land due to storm'
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff) }

    it 'should allow a plane to take off' do
      subject.land(plane)
      expect(subject.takeoff).to eq plane
    end

    it 'should allow a plane to take off and report plane is not in the airport' do
      subject.land(plane)
      subject.takeoff
      expect(subject.planes).to_not include plane
    end

    it 'should prevent take off when stormy' do
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.takeoff }.to raise_error 'Unable to take off due to storm'
    end
  end

  describe 'feature' do
    it 'should land and take off multiple planes' do
      30.times { subject.land(plane) }
      20.times { subject.takeoff }
      expect(subject.planes.count).to eq 10
    end
  end
end
