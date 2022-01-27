require 'plane'

describe Plane do
  it "instructs plane to land" do
    plane = Plane.new
    expect(plane.instruct_to_land).to eq ("Plane has landed!")
  end

  it "instructs plane to take-off" do
    plane = Plane.new
    expect(plane.instruct_to_takeoff).to eq("Plane has taken off!")
  end

  it "prevent plane landing if airport capacity is full" do
    expect(subject.capacity_check).to eq("Plane has to wait for space")
  end

  it "checks for stormy weather" do
    expect(subject.weather_check).to eq(0)
  end
 
end