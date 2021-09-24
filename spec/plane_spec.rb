require "plane"


describe "Plane" do
  before(:each) do
    @test_plane = Plane.new()
  end

  it "should initialise a flying plane" do
    expect(@test_plane.class).to eq(Plane)
    expect(@test_plane.flying).to eq(true)
  end

  it "should set flying to false after landing" do
    expect(@test_plane.flying).to eq true
    @test_plane.land
    expect(@test_plane.flying).to eq false
  end
end