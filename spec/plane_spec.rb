require 'plane'

describe Plane do
  it "instructs plane to land" do
    plane = Plane.new
    expect(plane).to respond_to :instruct_to_land
  end

  it "instructs plane to take-off" do
    plane = Plane.new
    expect(plane).to respond_to :instruct_to_takeoff
  end

  it "prevent plane landing if airport capacity is full" do
    plane = Plane.new
      airport_capacity = 21
      current_capacity = 20
    expect(plane.airport_capacity_check(airport_capacity <= current_capacity)).to eq("Plane has to wait for space")
  end

  
end