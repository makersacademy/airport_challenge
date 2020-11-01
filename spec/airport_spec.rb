require 'airport'

describe Airport do
  it "Allows the user to create an instance of Airport" do
    expect(subject).to be_an_instance_of(Airport)
  end
  describe '#land' do
    it "Instances of airport respond to the land method, accepting plane as argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it "airport should store the landed plane" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
    it "When a plane is in an airport, it will not respond to #land" do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "This plane has already landed"
    end
    describe "When airport is at capacity" do
      it "Does not allow planes to land" do
        Airport::DEFAULT_CAPACITY.times { subject.land Plane.new } 
        expect { subject.land Plane.new }.to raise_error "Airport full! You cannot land here!"
      end
    end
  end
  describe '#takeoff' do
    it 'Instances of airport respond to the takeoff method' do
      expect(subject).to respond_to(:takeoff).with(1).argument
    end
    it "airport should release the stored plane" do
      plane = Plane.new
      subject.takeoff(plane)
      expect(subject.planes).to_not include(plane)
    end
  end
end
