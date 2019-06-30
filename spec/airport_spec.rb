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
    allow(@airport).to receive(:stormy?) { false }
    expect(@airport.land_plane(@plane)).to eq [@plane]
  end

  it "adds second plane to airport on landing" do
    allow(@airport).to receive(:stormy?) { false }
    @airport.land_plane(@plane)
    plane2 = Plane.new
    expect(@airport.land_plane(plane2)).to eq [@plane, plane2]
  end
  
  it "returns an empty airport on launching its only plane" do
    allow(@airport).to receive(:stormy?) { false }
    @airport.land_plane(@plane)
    expect(@airport.launch_plane(@plane)).to eq []
  end

  it "removes specific plane from airport on launching plane" do
    allow(@airport).to receive(:stormy?) { false }
    plane2 = Plane.new
    @airport.land_plane(@plane)
    @airport.land_plane(plane2)
    @airport.launch_plane(@plane)
    expect(@airport.planes).to eq [plane2]
  end

  it "responds to 'stormy' method" do
    expect(@airport).to respond_to(:stormy?)
  end

  it "prevents 'launch_plane' and raises error if weather is stormy" do
    allow(@airport).to receive(:stormy?) { false }
    @airport.land_plane(@plane)
    allow(@airport).to receive(:stormy?) { true }
    expect { @airport.launch_plane(@plane) }.to raise_error "Cannot take-off, weather is stormy."
  end

  it "prevents 'land_plane' and raises error if weather is stormy" do
    allow(@airport).to receive(:stormy?) { true }
    expect { @airport.land_plane(@plane) }.to raise_error "Cannot land, weather is stormy."
  end

  it "prevents 'land_plane' and raises error when airport is full" do
    allow(@airport).to receive(:stormy?) { false }
    capacity = @airport.capacity
    capacity.times { @airport.land_plane(Plane.new) }
    expect { @airport.full? }.to raise_error "Cannot land, airport full."
  end

  it "creates airport with default capacity of 5 planes" do
    expect(@airport.capacity).to eq 5
  end

  it "creates airport with overridden capacity of 20" do
    big_airport = Airport.new(20)
    expect(big_airport.capacity).to eq 20
  end

  it "prevents launching plane from empty airport and raises error" do
    allow(@airport).to receive(:stormy?) { false }
    expect { @airport.launch_plane(@plane) }.to raise_error "Plane cannot take-off, not in airport."
  end

  it "prevents launching plane that is not in airport and raises error" do
    allow(@airport).to receive(:stormy?) { false }
    plane2 = Plane.new
    @airport.land_plane(@plane)
    expect { @airport.launch_plane(plane2) }.to raise_error "Plane cannot take-off, not in airport."
  end

  it "prevents landing a plane that is already in airport and raises error" do
    allow(@airport).to receive(:stormy?) { false }
    @airport.land_plane(@plane)
    expect { @airport.land_plane(@plane) }.to raise_error "Plane is already at the airport"
  end
end
