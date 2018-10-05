require 'airport'
require 'plane'

describe Airport do

  before :each do
    @airport = Airport.new
    @plane = Plane.new
  end

  it "lands a plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "lets a plane takeoff" do
    expect(@airport.takeoff(@plane)).to eq("Plane has taken off")
  end

end
