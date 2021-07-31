require 'plane'
require 'airport'

describe Plane do
  it "checks if plane is at airport" do
    weather_today = Weather.new([:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny])
    allow(weather_today).to receive(:isStormy?) { false }
    my_plane = Plane.new
    my_airport = Airport.new(my_plane)
    my_airport.take_off(my_plane, weather_today)
    expect(my_plane.at_airport?).to eq(false)
  end
end