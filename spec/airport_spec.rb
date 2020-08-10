require 'airport'

describe Airport do
  it 'should exist' do
    expect(subject).to be_instance_of Airport
  end
  it 'responds to method land' do
    expect(subject).to respond_to(:land)
  end
  it 'responds to method take_off' do
    expect(subject).to respond_to(:take_off)
  end
  it 'responds to attr_accessor for landed_planes' do
    expect(subject).to respond_to(:landed_planes)
  end
  it 'responds to attr_accessor for weather' do
    expect(subject).to respond_to(:weather)
  end
  it 'responds to attr_accessor for airport_capacity' do
    expect(subject).to respond_to(:airport_capacity)
  end

  describe '#land' do
    it 'adds plane to landed_planes array' do
      allow(subject).to receive(:weather?) { true }
      plane = Plane.new
      subject.land(plane)
      expect(subject.landed_planes).to include(plane)
    end
    it 'throws an error when plane tries to land if airport is full to default capacity' do
      allow(subject).to receive(:weather?) { true }
      20.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport full, no space to land'
    end
    it 'throws an error when plane tries to land if airport is full to custom capacity, 40 in this case' do
      airport = Airport.new(40)
      allow(airport).to receive(:weather?) { true }
      40.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error 'Airport full, no space to land'
    end
    it 'throws an error when plane tries to land in stormy weather' do
      allow(subject).to receive(:weather?) { false }
      expect { subject.land Plane.new }.to raise_error 'Weather not suitable for landing'
    end
    it 'throws an error when plane tries to land but is already in the airport' do
      allow(subject).to receive(:weather?) { true }
      plane = Plane.new
      subject.land(plane)
      expect { subject.land plane }.to raise_error 'Plane has already landed at airport'
    end
  end
  describe '#take_off' do
    it 'removes plane from landed_planes array' do
      allow(subject).to receive(:weather?) { true }
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.landed_planes).not_to include(plane)
    end
    it 'throws an error if plane tries to take off but weather is stormy' do
      allow(subject).to receive(:weather?) { false }
      expect { subject.take_off Plane.new }.to raise_error 'Weather not suitable for flight'
    end
    it 'throws an error when a plane that is not in the airport is instructed to take off' do
      allow(subject).to receive(:weather?) { true }
      expect { subject.take_off Plane.new }.to raise_error 'Plane is not currently at this airport'
    end
  end
  describe '#change_capacity' do
    it 'changes @airport_capacity to the integer it is passed, 30 in this case' do
      airport = Airport.new
      airport.change_capacity(30)
      expect(airport.airport_capacity).to eq 30
    end
  end
end
