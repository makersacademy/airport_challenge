require 'airport'

describe Airport do
  context "initialize" do
    it 'default capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport full")
    end
    it 'allows capacity to be overriden' do
      airport = Airport.new(30)
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
      subject.land(plane)  
      expect(subject.planes).to include(plane)
    end
    it 'prevents landing when airport is full' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error("Airport full")
    end
    it 'prevents planes that are landed from landing again' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Plane already landed")
    end
  end
  context '#take_off' do
    it 'responds to a take off method' do
      expect(subject).to respond_to(:take_off)
    end
    it 'tells a plane to take off' do
      subject.land(Plane.new)
      expect(subject.take_off).to be_an_instance_of(Plane)
    end
    it 'raises an error if there are no planes' do
      expect { subject.take_off }.to raise_error("No planes")
    end
  end
  context '#in?(plane)' do
    it 'confirms a plane is no longer in the airport after take off' do
      subject.land(Plane.new)
      plane = subject.take_off
      expect(subject.in?(plane)).to eq false
    end
  end
end
