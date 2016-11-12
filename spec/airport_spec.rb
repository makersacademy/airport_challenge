require "airport"

describe Airport do

  it "should dock a plane" do
    plane = Plane.new
    subject.dock(plane)
    expect(subject.planes).to include(plane)
  end

  it "should instruct a plane to take off" do
    plane = Plane.new
    allow(subject).to receive(:sunny?).and_return(true)
    subject.planes << plane
    subject.taxi(plane)
    expect(subject.planes).not_to include(plane)
  end

  it "should not allow plane to taxi if stormy" do
    plane = Plane.new
    subject.dock(plane)
    allow(subject).to receive(:sunny?).and_return(false)
    expect{subject.taxi(plane)}.to raise_error("Too stormy to taxi plane")
  end

  it "should not be able to taxi from another airport" do
    plane = Plane.new
    airport = Airport.new
    airport.dock(plane)
    expect{subject.taxi(plane)}.to raise_error("Plane is not at this airport")
  end

  it "should have a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "should be able to specify capacity" do
    airport = Airport.new(10)
    expect(airport.capacity).to eq(10)
  end

  it "should not de able to have more planes than capacity" do
    subject.capacity.times {subject.dock(Plane.new)}
    expect{subject.dock(Plane.new)}.to raise_error("Airport is full")
  end

describe "Weather conditions" do

  it "should be sunny" do
    sun = double("sun", :sunny? => true)
    expect(sun.sunny?).to be true
  end

  it "should be bad weather" do
    storm = double("storm", :sunny? => false)
    expect(storm.sunny?).to be false
  end
end

end
