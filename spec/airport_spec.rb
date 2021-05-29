require 'airport'

describe Airport do
  # mock an instance of the Plane class each time it's needed
  let(:plane) { instance_double(Plane) }

  context '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'can land a plane' do
      expect(subject.land(plane)).to eq [plane]
    end

    it "raises an error if you try to land a plane that's already landed" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'That plane has already landed.'
    end

    it 'returns parked planes in the hangar' do
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end
    
    it 'raises an error when the airport is full' do
      # land 'capacity' amount of mocked planes in the airport
      subject.capacity.times { subject.land(instance_double(Plane)) }
      expect { subject.land(plane) }.to raise_error 'The airport is full, please do not land.'
    end
  end
  
  context 'initialization' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows you to change the capacity' do
      airport = Airport.new(50)
      50.times { airport.land(instance_double(Plane)) }
      expect { airport.land(instance_double(Plane)) }.to raise_error 'The airport is full, please do not land.'
    end

    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.land(instance_double(Plane)) }
      expect { subject.land(plane) }.to raise_error 'The airport is full, please do not land.'      
    end
  end
  
  context '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "can allow planes to take off and confirms that it's left the hangar" do
      # put a plane in the hangar first
      subject.land(plane)
      # when the plane takes off, we want to see whats in the hangar? or we want to see error?
      expect(subject.take_off(plane)).to eq []
    end

    it 'only allows planes that are at that airport to take off' do
      expect { subject.take_off(plane) }.to raise_error 'That plane is not at this airport.'
    end
  end

end
