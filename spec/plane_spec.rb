require "plane"

describe Plane do
  let(:clear_weather) { double("weather", { stormy?: false }) }

  it "Default to not be flying" do
    expect(subject.flying?).to eq false
  end

  it "Can be set to flying" do
    new_plane = Plane.new(true)
    expect(new_plane.flying?).to eq true
  end

  it "Can be instructed to land at airport" do
    new_airport = Airport.new
    new_plane = Plane.new(true)
    new_plane.land_at_airport(new_airport, clear_weather)
    expect(new_plane.flying?).to eq false 
  end

  it "Can be instructed to takeoff from airport" do
    new_airport = Airport.new
    new_plane = Plane.new(true)
    new_plane.land_at_airport(new_airport, clear_weather)
    new_plane.takeoff_from_airport(new_airport, clear_weather)
    expect(new_plane.flying?).to eq true
  end
end
