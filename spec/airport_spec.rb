require 'airport'
require 'plane'

describe Airport do

  before :each do
    @airport = Airport.new
    @plane = Plane.new
  end

  it "lands a plane" do
    expect(@airport).to respond_to(:land).with(1).argument
  end

  it "confirms a plane has landed" do
    expect(@airport.land(@plane)).to eq("Plane has landed")
  end

  it "lets a plane takeoff" do
    expect(@airport).to respond_to(:takeoff).with(1).argument
  end

  it "confirms a plane has taken off" do
    #allow(@airport).to receive(:check_weather) { "sunny" }
    $weather = "sunny"
    expect(@airport.takeoff(@plane)).to eq("Plane has taken off")
  end

  it "allows you to check weather" do
    expect(@airport.check_weather).to be_a(String)
  end

  it "prevents takeoff when weather is stormy" do
    $weather = "stormy"
    expect{@airport.takeoff(@plane)}.to raise_error("Unable to takeoff due to stormy weather")
  end

end
