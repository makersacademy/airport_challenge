require './lib/airport'
require './lib/plane'

describe Airport do
  

  it "instructs a plane to land at an airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

  it "instructs a plane to take off" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq plane
  end

  it "raises and error when airport is full" do
    plane = Plane.new
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'Airport is full'
  end

  it "sets capacity to default value" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "raises an error when there are no planes in the airport" do
    plane = Plane.new
    expect{subject.takeoff(plane)}.to raise_error "There are no planes in the airport."
  end

  describe "#report_taking_off" do

    it "returns message that the plane has taken off" do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.report_taking_off).to eq("Plane is no longer at the airport.")
    end
    
  end

end