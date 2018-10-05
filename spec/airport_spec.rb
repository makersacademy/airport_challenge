require "airport.rb"
require "plane.rb"

describe Airport do

  before(:all) do
    @airport = Airport.new
    @plane = Plane.new
  end

  it "can instruct a plane" do
    expect(@airport).to respond_to :instruct
  end

  it "tells a plane to take off" do
    @airport.instruct(@plane)
    expect(@plane.status).to eq "flying"
  end
end
