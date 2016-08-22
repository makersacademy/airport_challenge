require 'airport'
require 'weather'

describe Airport do

  it "can land " do
    expect(subject).to respond_to :land
  end

  it "make a plane land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "can store planes" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.landed_planes).to include plane
  end

  it "responds to #takeoff method" do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it "no longer contains that plane in @landed_planes after takeoff" do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.landed_planes).not_to include plane
  end

# passes if random weather changed in code to be stormy,
# can't figure out how to change in rspec
  it "cannot land when stormy" do
    plane = Plane.new
    expect{subject.land(plane)}.to raise_error "Mayday, MAYDAY... can't land in stormy weather"
  end

  describe "Airport capacity tests" do
    it "raises error when full to capacity" do
      4.times { subject.land(Plane.new) }
      expect{ subject.land(Plane.new)}.to raise_error "No space"
    end

    it "has a default capacity" do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end
    end

    it "has a variable capacity which can be set when instantiating" do
      airport = Airport.new(20)
      19.times { airport.land Plane.new }
      expect{airport.land Plane.new }.to raise_error "No space"
    end
end
