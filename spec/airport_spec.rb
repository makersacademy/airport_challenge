require 'airport'
require 'plane'

describe Airport do

  # test 1
  it "responds to plane take off method" do
    expect(Airport.new(Plane.new)).to respond_to('take_off')
  end

  # test 2
  it "lands planes" do
    weather_today = Weather.new([:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny])
    allow(weather_today).to receive(:isStormy?) { false }
    my_plane = Plane.new()
    my_airport = Airport.new(my_plane)
    my_airport.take_off(my_plane, weather_today)
    my_airport.land(my_plane, weather_today)
    expect(my_airport.planes.last).to eq my_plane
  end

  it "take off plane" do
    weather_today = Weather.new([:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny])
    allow(weather_today).to receive(:isStormy?) { false }
    my_airport = Airport.new
    5.times { my_airport.land(Plane.new, weather_today)}
    planes_at_airport = my_airport.planes.length
    my_airport.take_off(my_airport.planes.first, weather_today)
    expect(my_airport.planes.length).to eq planes_at_airport - 1
  end


end





# dan_bike = Bike.new
# subject.dock(dan_bike)
# expect(subject.bikes.last).to eq dan_bike