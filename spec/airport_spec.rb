require "airport"
require "plane"
CAPACITY = 20

describe "Airport" do
  before(:each) do
    @test_airport = Airport.new(CAPACITY)
    # TODO: refactor to use stub
    @test_plane = Plane.new()
  end

  it "should set a custom capacity " do
    expect(@test_airport.capacity).to eq(CAPACITY)
  end

  it "should set a default capacity if not provided" do
    @test_airport = Airport.new()

    expect(@test_airport.capacity).to eq 10
  end

  it "should land when given a plane" do
    @test_airport.attempt_landing(@test_plane)
    expect(@test_airport.landed_planes).to eq([@test_plane])
  end

  it "should raise an error when trying to land an already landed plane" do
    @test_airport.attempt_landing(@test_plane)
    expect(@test_airport.landed_planes).to eq([@test_plane])

    expect{@test_airport.attempt_landing(@test_plane)}.to raise_error "Plane is already landed"
  end

  it "should raise an error when trying to land a plane at a full airport" do
    CAPACITY.times do 
      # TODO: stub this
      @test_airport.attempt_landing(Plane.new)
    end
    expect(@test_airport.landed_planes.length).to eq(20)

    expect{@test_airport.attempt_landing(@test_plane)}.to raise_error "Airport full!"
  end

end