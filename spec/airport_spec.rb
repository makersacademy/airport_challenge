require 'airport'
require 'plane'
require 'weather'

describe Airport do

  before(:each) do
    @fake_sunny = double(:weather, :stormy? => false)
    @fake_stormy = double(:weather, :stormy? => true)
    @plane = Plane.new
    @airport = Airport.new
  end

  it "adds a plane to @planes" do
    @airport.land(@plane, @fake_sunny)
    expect(@airport.planes).to eq [@plane]
  end
  it "removes a plane from @planes" do
    @airport.weather = 'sunny'
    @airport.land(@plane, @fake_sunny)
    @airport.take_off(@plane, @fake_sunny)
    expect(@airport.planes).to eq []
  end
  it "raises an error when the station is full" do
    expect {
      plane2 = Plane.new
      airport1 = Airport.new(1)
      airport1.land(@plane, @fake_sunny)
      airport1.land(plane2, @fake_sunny)
    }.to raise_error("The airport is full")
  end
  it "allows default capacity to be overridden" do
    expect(
      Airport.new(30).capacity
    ).to eq 30
  end
  it "raises an error when you try to take off a plane that isn't in that airport" do
    expect {
      @airport.take_off(@plane, @fake_sunny)
    }.to raise_error("This plane is not in this airport")
  end
  it "raises an error when you try to land a plane that is already in an airport" do
    expect {
      airport2 = Airport.new
      @airport.land(@plane, @fake_sunny)
      airport2.land(@plane, @fake_sunny)
    }.to raise_error("This plane is already landed")
  end
  it "raises an error when you try to land a plane when it is stormy" do
    expect {
      @airport.land(@plane, @fake_stormy)
    }.to raise_error("You can't land when it is stormy")
  end
  it "raises an error when you try to take off a plane when it is stormy" do
    expect {
      @airport.land(@plane, @fake_sunny)
      @airport.take_off(@plane, @fake_stormy)
    }.to raise_error("You can't take off when it is stormy")
  end
end
