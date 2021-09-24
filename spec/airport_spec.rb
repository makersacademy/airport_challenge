require "airport"
require "plane"
CAPACITY = 20

# this needs to be refactored to use stubs rather than the actual classes
# but i have ran out of time :()
describe "Airport" do
  before(:each) do
    @test_airport = Airport.new(CAPACITY)
    allow(@test_airport.weather).to receive(:stormy).and_return(false)
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

    expect { @test_airport.attempt_landing(@test_plane) }.to raise_error "Plane is already landed"
  end

  it "should raise an error when trying to land a plane at a full airport" do
    CAPACITY.times do 
      # TODO: stub this
      @test_airport.attempt_landing(Plane.new)
    end
    expect(@test_airport.landed_planes.length).to eq(20)

    expect { @test_airport.attempt_landing(@test_plane) }.to raise_error "Airport full!"
  end

  it "should attempt to take off, and succeed if the plane is landed" do
    expect(@test_airport.landed_planes).to eq([])

    @test_airport.attempt_landing(@test_plane)
    expect(@test_airport.landed_planes).to eq([@test_plane])

    @test_airport.attempt_takeoff(@test_plane)
    expect(@test_airport.landed_planes).to eq([])
  end

  it "should attempt to take off, and fail if the airport is empty" do
    expect(@test_airport.landed_planes).to eq([])

    expect { @test_airport.attempt_takeoff(@test_plane) }.to raise_error("Airport empty!")
  end

  it "should attempt to take off, and fail if the plane does not match a plane in the airport" do
    expect(@test_airport.landed_planes).to eq([])

    test_plane_2 = Plane.new
    @test_airport.attempt_landing(test_plane_2)
    expect(@test_airport.landed_planes[0].class).to eq(Plane)

    expect { @test_airport.attempt_takeoff(@test_plane) }.to raise_error("Your plane isn't in the airport!")

  end

  it "should fail to take off if it is stormy" do
    expect(@test_airport.landed_planes).to eq([])

    test_plane_2 = Plane.new
    @test_airport.attempt_landing(test_plane_2)

    allow(@test_airport.weather).to receive(:stormy).and_return(true)
  
    expect { @test_airport.attempt_takeoff(@test_plane) }.to raise_error("Too stormy to takeoff")
  end

  it "should fail to take off if it is stormy" do
    allow(@test_airport.weather).to receive(:stormy).and_return(true)
    expect(@test_airport.landed_planes).to eq([])
  
    expect { @test_airport.attempt_landing(@test_plane) }.to raise_error("Too stormy to land")
  end

end
