require "airport"
require "plane"
CAPACITY = 20

describe "Airport" do
  before(:each) do
    @test_airport = Airport.new(CAPACITY)
    # TODO: refactor to use stub
    @test_plane = Plane.new()
  end

  it "should have a capacity" do
    expect(@test_airport.capacity).to eq(CAPACITY)
  end

  it "should land when given a plane" do
    @test_airport.land(@test_plane)
    expect(@test_airport.landed_planes).to eq([@test_plane])
  end

  it "should raise an error when trying to land an already landed plane" do
    @test_airport.land(@test_plane)
    expect(@test_airport.landed_planes).to eq([@test_plane])

    expect{@test_airport.land(@test_plane)}.to raise_error "Plane is already landed"
    
  end
end