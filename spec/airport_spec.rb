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

  it "Lets a plane land and takeoff then checks that the plane has left" do
    plane = Plane.new
    @airport.land(plane)
    @airport.take_off(plane)
    expect(@airport.is_here?(plane)).to eq false
  end

  it "Dosen't allow planes to takeoff when its stormy" do
    plane = Plane.new
    @airport.land(plane)
    @airport.weather("stormy")
    expect { raise @airport.take_off(plane) }.to raise_error("It is too stormy to land or takeoff")
  end

  it "Dosen't allow planes to land when its stormy" do
    plane = Plane.new
    @airport.weather("stormy")
    expect { @airport.land(plane) }.to raise_error("It is too stormy to land or takeoff")
  end

  it "Dosen't allow planes to land when airport is full" do
    plane = Plane.new
    plane2 = Plane.new
    @airport.land(plane)
    expect { @airport.land(plane2) }.to raise_error("The airport is full")
  end
end
