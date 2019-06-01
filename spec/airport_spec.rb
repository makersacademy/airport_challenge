require "airport"
require "plane"
require "weather"

describe Airport do

before(:each) do
  @airport = Airport.new
  @plane = Plane.new
  @weather = Weather.new
end

#User Story 1
  it "responds to message land" do
    expect(@airport).to respond_to(:land)
  end

  it "adds a plane to contents when it has landed a plane" do
    allow(@weather).to receive(:stormy?) {false}
    @airport.land(@plane,@weather)
    expect(@airport.contents).to include(@plane)
  end

#User Story 2
  it "responds to message takeoff" do
    expect(@airport).to respond_to(:take_off)
  end

  it "no longer contains a plane once it has taken off" do
    allow(@weather).to receive(:stormy?) {false}
    @airport.land(@plane,@weather)
    allow(@weather).to receive(:stormy?) {false}
    @airport.take_off(@plane, @weather)
    expect(@airport.contents).not_to include(@plane)
  end

  it "confirms take off has occurred" do
    allow(@weather).to receive(:stormy?) {false}
    @airport.land(@plane,@weather)
    allow(@weather).to receive(:stormy?) {false}
    expect(@airport.take_off(@plane, @weather)).to eq("Take off complete")
  end
#User Story 3
  it "does not allow take off if weather is stormy" do
    allow(@weather).to receive(:stormy?) {false}
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
  it "has a default airport capacity which can be overridden" do
    expect(@airport.capacity).to eq(5)
  end

  it "knows when it is full" do
    allow(@airport).to receive(:capacity) {1}
    allow(@weather).to receive(:stormy?) {false}
    @airport.land(@plane, @weather)
    allow(@weather).to receive(:stormy?) {false}
    expect{@airport.land(@plane, @weather)}.to raise_error("Airport full")
  end

  it "does not all planes to land when airport is full" do
    allow(@weather).to receive(:stormy?) {false}
    allow(@airport).to receive(:full?) {true}
    expect{@airport.land(@plane,@weather)}.to raise_error("Airport full")
  end
end
