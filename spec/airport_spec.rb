require 'airport'
require 'plane'
describe Airport do
  before :each do
    @airport = Airport.new
  end
  it "Lets a plane land" do
    expect(@airport).to respond_to(:land).with(1).arguments
  end

  it "Lets the same plane land and takeoff" do
    plane = Plane.new
    @airport.land(plane)
    expect(@airport.take_off(plane)).to eq plane
  end 

end
