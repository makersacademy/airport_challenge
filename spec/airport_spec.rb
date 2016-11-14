require "airport"

describe Airport do
  subject (:airport) {described_class.new}
  let (:plane) {double(:plane)}

  it "should dock a plane" do
    airport.dock(plane)
    expect(airport.planes).to include(plane)
  end

  it "should instruct a plane to take off" do
    allow(airport).to receive(:sunny?).and_return(true)
    allow(plane).to receive(:status).and_return(true)
    allow(plane).to receive(:airborne)
    airport.planes << plane
    airport.taxi(plane)
    expect(airport.planes).not_to include(plane)
  end

  it "should not allow plane to taxi if stormy" do
    airport.dock(plane)
    allow(plane).to receive(:status).and_return(true)
    allow(airport).to receive(:sunny?).and_return(false)
    expect{airport.taxi(plane)}.to raise_error("Too stormy to taxi plane")
  end

  it "should not be able to taxi from another airport" do
    airport2 = Airport.new
    airport2.dock(plane)
    expect{airport.taxi(plane)}.to raise_error("Plane is not at this airport")
  end

  it "should have a default capacity" do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "should be able to specify capacity" do
    airport = Airport.new(10)
    expect(airport.capacity).to eq(10)
  end

  it "should not de able to have more planes than capacity" do
    airport.capacity.times {airport.dock(Plane.new)}
    expect{airport.dock(plane)}.to raise_error("Airport is full")
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
