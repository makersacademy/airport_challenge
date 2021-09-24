require "airport"
  
describe Airport do
  it "should show plane in airport array after airport tells it to land" do
    plane = double("plane double")
    subject.land(plane)
    expect(subject.planes.length).to(eq(1))
  end
  it "should show plane is no longer in airport array after airport tells it to takeoff" do
    plane = double("plane double")
    subject.planes << plane
    subject.takeoff()
    expect(subject.planes.length).to(eq(0))
  end
end
