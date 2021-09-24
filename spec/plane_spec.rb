require "plane"


describe "Plane" do
  before(:each) do
    @test_plane = Plane.new()
    @test_airport = Airport.new(20)
  end

  it "should initialise a plane" do
    expect(@test_plane.class).to eq(Plane)
  end

  it "should set flying to false after landing" do
    expect(@test_plane.flying).to eq true
    @test_plane.land
    expect(@test_plane.flying).to eq false
  end
end