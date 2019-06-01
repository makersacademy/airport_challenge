require "airport"
require "plane"
require "weather"

describe Airport do

before(:all) do
  @airport = Airport.new
  @plane = Plane.new
  @weather = Weather.new
end

#User Story 1
  it "responds to message land" do
    expect(@airport).to respond_to(:land)
  end

  it "adds a plane to contents when it has landed a plane" do
    @airport.land(@plane)
    expect(@airport.contents).to include(@plane)
  end

#User Story 2
  it "responds to message takeoff" do
    expect(@airport).to respond_to(:take_off)
  end

  it "no longer contains a plane once it has taken off" do
    @airport.land(@plane)
    allow(@weather).to receive(:stormy?) {false}
    @airport.take_off(@plane, @weather)
    expect(@airport.contents).not_to include(@plane)
  end

  it "confirms take off has occurred" do
    @airport.land(@plane)
    allow(@weather).to receive(:stormy?) {false}
    expect(@airport.take_off(@plane, @weather)).to eq("Take off complete")
  end
#User Story 3
  it "does not allow take off if weather is stormy" do
    @airport.land(@plane)
    allow(@weather).to receive(:stormy?) {true}
    expect{@airport.take_off(@plane,@weather)}.to raise_error("Weather preventing takeoff")
  end
end
