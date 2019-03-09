require "airport"
require "plane"
require "weather"

describe Airport do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
    @airport.extend(Weather)
  end

  it "responds to 'land_plane' method" do
    expect(@airport).to respond_to(:land_plane)
  end

  it "responds to 'launch_plane' method" do
    expect(@airport).to respond_to(:launch_plane)
  end

  it "adds plane to airport on landing" do
    allow(@airport).to receive(:is_stormy?) { false }
    expect(@airport.land_plane(@plane)).to eq [@plane]
  end

  it "adds second plane to airport on landing" do
    allow(@airport).to receive(:is_stormy?) { false }
    @airport.land_plane(@plane)
    plane2 = Plane.new
    expect(@airport.land_plane(plane2)).to eq [@plane, plane2]
  end
  
  it "returns an empty airport on launching its only plane" do
    allow(@airport).to receive(:is_stormy?) { false }
    @airport.land_plane(@plane)
    expect(@airport.launch_plane(@plane)).to eq []
  end

  it "removes specific plane from airport on launching plane" do
    allow(@airport).to receive(:is_stormy?) { false }
    plane2 = Plane.new
    @airport.land_plane(@plane)
    @airport.land_plane(plane2)
    expect(@airport.launch_plane(@plane)).to eq [plane2]
  end

  it "responds to 'is_stormy' method" do
    expect(@airport).to respond_to(:is_stormy?)
  end

  it "prevents 'launch_plane' if weather is stormy" do
    allow(@airport).to receive(:is_stormy?) { true }
    @airport.land_plane(@plane)
    expect(@airport.launch_plane(@plane)).to eq "Cannot take-off, weather is stormy."
  end

  it "prevents 'land_plane' if weather is stormy" do
    allow(@airport).to receive(:is_stormy?) { true }
    expect(@airport.land_plane(@plane)).to eq "Cannot land, weather is stormy."
  end

  it "prevents 'land_plane' when capacity of planes are in the airport" do
    allow(@airport).to receive(:is_stormy?) { false }
    capacity = @airport.capacity
    capacity.times { @airport.land_plane(Plane.new) }
    expect(@airport.full?).to eq "Cannot land, airport full."
  end

  it "creates airport with default capacity of 5 planes" do
    expect(@airport.capacity).to eq 5
  end

  it "creates airport with overridden capacity of 20" do
    big_airport = Airport.new(20)
    expect(big_airport.capacity).to eq 20
  end
end