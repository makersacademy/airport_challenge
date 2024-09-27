require 'airport'
describe Airport do
  
  describe '#land' do
    it 'lands a plane' do 
      plane = Plane.new
      allow(subject).to receive(:weather) { 'sunny' }
      expect(subject.land(plane)).to eq [plane]
    end

    it "cannot land a plane already landed" do
      plane = Plane.new
      allow(subject).to receive(:weather) { 'sunny' }
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error('This plane has already landed')
    end

    it 'errors when airport is full' do
      allow(subject).to receive(:weather) { 'sunny' }
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error('No space available')
    end

    it 'cannot land a plane in stormy weather' do 
      plane = Plane.new
      allow(subject).to receive(:weather) { 'stormy' }
      expect { subject.land(plane) }.to raise_error('Unable to land - the weather is currently stormy')
    end
  end

  describe "#takeoff" do
    it 'instructs a plane to takeoff' do
      plane = Plane.new
      allow(subject).to receive(:weather) { 'sunny' }
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it 'leaves the airport after takeoff' do
      plane = Plane.new
      plane2 = Plane.new
      allow(subject).to receive(:weather) { 'sunny' }
      subject.land(plane)
      subject.land(plane2)
      subject.takeoff(plane)
      expect(subject.airport).not_to include([plane])
    end

    it 'cannot take off if already taken off' do 
      plane = Plane.new
      allow(subject).to receive(:weather) { 'sunny' }
      subject.land(plane)
      subject.takeoff(plane)
      expect { subject.takeoff(plane) }.to raise_error('This plane has already taken off')
    end

    it 'cannot take off in stormy weather' do 
      plane = Plane.new
      allow(subject).to receive(:weather) { 'sunny' }
      subject.land(plane)
      allow(subject).to receive(:weather) { 'stormy' }
      expect { subject.takeoff(plane) }.to raise_error('Unable to take off - the weather is currently stormy')
    end
  end

  describe '#initialize' do
    it 'has a default capacity of 20' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "allows input for airport capacity" do 
      airport = Airport.new(15)
      expect(airport.capacity).to eq 15
    end
  end

  describe "#full?" do
    it 'checks to see if the airport is full' do
      allow(subject).to receive(:weather) { 'sunny' }
      subject.capacity.times { subject.land(Plane.new) }
      expect(subject.full?).to eq true
    end
  end
end
