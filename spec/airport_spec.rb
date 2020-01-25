require 'airport'

describe Airport do
  context "initialize" do
    it 'defaults capacity at 20 in the absence of a given argument' do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.capacity).to eq 20
      described_class::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport full")
    end

    it 'allows capacity to be overriden' do
      airport = Airport.new(30)
      allow(airport).to receive(:stormy?) { false }
      expect(airport.capacity).to eq 30
      described_class::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.not_to raise_error
    end
  end
  context '#land(plane)' do
    let(:plane) { Plane.new }
    it 'responds to a land method' do
      expect(subject).to respond_to(:land)
    end
    it 'accepts a landing plane' do
      allow(subject).to receive(:stormy?) { false }
      expect { subject.land(plane) }.not_to raise_error   
    end
    it 'prevents landing when airport is full' do
      allow(subject).to receive(:stormy?) { false }
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error("Airport full")
    end
    it 'prevents planes that are landed from landing again' do
      allow(subject).to receive(:stormy?) { false }  
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Plane already in airport")
    end
    it 'prevents landings when stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error("No landings permitted when stormy")
    end
  end
  context '#take_off(plane)' do
    let(:plane) { Plane.new }
    it 'tells a plane to take off' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
    it 'confirms a plane is no longer in the airport after take off' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end
    it 'ensures planes only take off from airports they are in' do
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect { subject.take_off(Plane.new) }.to raise_error("Plane not in airport")
    end
    it 'raises an error if there are no planes' do
      allow(subject).to receive(:stormy?) { false }
      expect { subject.take_off(plane) }.to raise_error("No planes")
    end
    it 'prevents takeoff when stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error("No takeoffs permitted when stormy")
    end
  end
end
