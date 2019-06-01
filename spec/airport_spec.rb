require "airport"
require "plane"
require "weather"

describe Airport do

before(:each) do
  @airport = Airport.new
  @plane = Plane.new
  @weather = Weather.new
  allow(@weather).to receive(:stormy?) {false}
end

#User Story 1
  it "responds to message land" do
    expect(@airport).to respond_to(:land)
  end

  it "adds a plane to contents when it has landed a plane" do
    @airport.land(@plane,@weather)
    expect(@airport.contents).to include(@plane)
  end

#User Story 2
  it "responds to message takeoff" do
    expect(@airport).to respond_to(:take_off)
  end

  it "no longer contains a plane once it has taken off" do
    @airport.land(@plane,@weather)
    @airport.take_off(@plane, @weather)
    expect(@airport.contents).not_to include(@plane)
  end

  it "confirms take off has occurred" do
    @airport.land(@plane,@weather)
    expect(@airport.take_off(@plane, @weather)).to eq("Take off complete")
  end
#User Story 3
  it "does not allow take off if weather is stormy" do
    @airport.land(@plane,@weather)
    allow(@weather).to receive(:stormy?) {true}
    expect{@airport.take_off(@plane,@weather)}.to raise_error("Weather preventing takeoff")
  end
#User Story 4
  it "does not allow landing if weather is stormy" do
    allow(@weather).to receive(:stormy?) {true}
    expect{@airport.land(@plane,@weather)}.to raise_error("Weather preventing landing")
  end

#User Story 5
  it "has a default airport capacity" do
    expect(@airport.capacity).to eq(5)
  end

  it "has a capacity which can be overridden" do
    @airport.capacity = 3
    expect(@airport.capacity).to eq(3)
  end

  it "knows when it is full" do
    allow(@airport).to receive(:capacity) {1}
    @airport.land(@plane, @weather)
    plane2 = Plane.new
    expect{@airport.land(plane2, @weather)}.to raise_error("Airport full")
  end

  it "does not allow planes to land when airport is full" do
    allow(@airport).to receive(:full?) {true}
    expect{@airport.land(@plane,@weather)}.to raise_error("Airport full")
  end

  it "can't land a plane that is already inside it" do
    planeB = Plane.new
    @airport.land(planeB, @weather)
    expect{@airport.land(planeB, @weather)}.to raise_error("Plane already landed")
  end

  it "can't take off a plane which is already in the air" do
    @airport.land(@plane, @weather)
    @airport.take_off(@plane, @weather)
    expect{@airport.take_off(@plane, @weather)}.to raise_error("Plane already in the sky")
  end

end
