require 'airport'
# requires the airport.rb file from lib

RSpec.describe "Airport" do
  # tests looking at the Airport class

  it "checks an airport's (default) capacity" do
    # arrange, act, assert
    my_airport = Airport.new
    expect(my_airport.check_capacity).to eq 20
  end

  it "can change an airport's maximum capacity" do
    my_airport = Airport.new
    expect(my_airport.change_capacity(40)).to eq 40
  end

  it "confirms an airport's maximum capacity has been changed to 40" do
    my_airport = Airport.new
    my_airport.change_capacity(40)
    expect(my_airport.check_capacity).to eq 40
  end

  it "counts how many planes there are in the airport" do
    my_airport = Airport.new
    my_plane_a = object_double(Plane.new("Plane A", "airport"))
    my_plane_b = object_double(Plane.new("Plane B", "airport"))
    my_plane_c = object_double(Plane.new("Plane C", "airport"))
    my_airport.park_plane(my_plane_a)
    my_airport.park_plane(my_plane_b)
    my_airport.park_plane(my_plane_c)
    expect(my_airport.how_many_planes_in_airport).to eq 3
  end
  
  it "checks if the airport is full (when capacity is 1 and there is 1 plane)" do
    my_airport = Airport.new
    my_airport.change_capacity(1)
    my_plane_a = object_double(Plane.new("Plane A", "airport"))
    my_airport.park_plane(my_plane_a)
    expect(my_airport.airport_full?).to eq true 
  end

  it "checks if the airport has space for more planes" do
    my_airport = Airport.new
    expect(my_airport.airport_full?).to eq false
  end

  it "checks that a plane can land and park at the airport" do
    my_airport = Airport.new
    my_plane_a = object_double(Plane.new("Plane A", "airport"))
    expect(my_airport.park_plane(my_plane_a)).to eq [my_plane_a]
  end

  # NEED TO ADD TESTS HERE - CHECK FOR PLANE BEING ABLE TO LAND IN CORRECT WEATHER / CAPACITY

  it "finds out which planes are in the airport" do
    my_airport = Airport.new
    my_plane_c = object_double(Plane.new("Plane C", "airport"))
    my_airport.park_plane(my_plane_c)
    expect(my_airport.which_planes_in_airport).to eq [my_plane_c]
  end  

  it "looks for Plane D in the airport" do
    my_airport = Airport.new
    my_plane_d = Plane.new("Plane D", "airport")
    my_airport.park_plane(my_plane_d)
    expect(my_airport.specific_plane_in_airport?(my_plane_d)).to eq true 
  end

  it "looks for and does not find Plane E in the airport (when other planes are parked)" do
    my_airport = Airport.new
    my_plane_c = Plane.new("Plane C", "airport")
    my_plane_d = Plane.new("Plane D", "airport")
    my_plane_e = Plane.new("Plane E","sky")
    my_airport.park_plane(my_plane_c)
    my_airport.park_plane(my_plane_d)
    expect(my_airport.specific_plane_in_airport?(my_plane_e)).to eq false 
  end

  it "looks for and does not find Plane F in the airport (when the airport is empty)" do
    my_airport = Airport.new
    my_plane_f = Plane.new("Plane F","sky")
    expect(my_airport.specific_plane_in_airport?(my_plane_f)).to eq false 
  end

end
