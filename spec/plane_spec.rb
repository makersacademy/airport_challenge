require "plane"

describe Plane do

  it "Plane default to not be flying" do
    expect(subject.flying?).to eq false
  end

  it "Plane can be set to flying" do
    new_plane = Plane.new(true)
    expect(new_plane.flying?).to eq true
  end

  it "Plane can be instructed to land at airport" do
    new_airport = Airport.new
    new_plane = Plane.new(true)
    new_plane.land_at_airport(new_airport)
    expect(new_plane.flying?).to eq false 
  end

  it "Plane can be instructed to takeoff from airport" do
    new_airport = Airport.new
    new_plane = Plane.new(true)
    new_plane.land_at_airport(new_airport)
    new_plane.takeoff_from_airport(new_airport)
    expect(new_plane.flying?).to eq true
  end
end
