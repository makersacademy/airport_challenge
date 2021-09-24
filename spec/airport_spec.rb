require "airport"
  
describe Airport do
  it "should show plane in airport array after airport tells it to land" do
    plane = double("plane double")
    subject.land(plane)
    expect(subject.planes.length).to(eq(1))
  end
end
