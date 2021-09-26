require 'airport'
# requires the airport.rb file from lib

RSpec.describe "Airport" do
  # tests looking at the Airport class

  it "checks an airport's maximum capacity" do
    # arrange, act, assert
    my_airport = Airport.new
    expect(my_airport.check_capacity).to eq 20
  end

  it "can change an airport's maximum capacity" do
    my_airport = Airport.new
    expect(my_airport.change_capacity(40)).to eq true
  end

  it "confirms an airport's maximum capacity has been changed to 40" do
    my_airport = Airport.new
    my_airport.change_capacity(40)
    expect(my_airport.check_capacity).to eq 40
  end

  it "counts how many planes are in the airport" do
    my_airport = Airport.new
    my_airport.park_plane("Plane 2")
    my_airport.park_plane("Plane 3")
    expect(my_airport.how_many_planes_in_airport).to eq 3
  end
  
  it "checks if the airport is full" do
    my_airport = Airport.new
    my_airport.change_capacity(1)
    expect(my_airport.airport_full?).to eq true 
  end

  it "checks if the airport is full (when capacity is 3 and there are 3 planes)" do
    my_airport = Airport.new
    my_airport.change_capacity(3)
    my_airport.park_plane("Plane 2")
    my_airport.park_plane("Plane 3")
    expect(my_airport.airport_full?).to eq true 
  end

  it "checks if the airport has space for more planes" do
    my_airport = Airport.new
    expect(my_airport.airport_full?).to eq false
  end

  it "checks that a plane can land and park at the airport" do
    my_airport = Airport.new
    my_plane_a = Plane.new("Plane A","")
    expect(my_airport.park_plane(my_plane_a)).to eq true
  end

  # NEED TO ADD TESTS HERE - CHECK FOR PLANE BEING ABLE TO LAND IN CORRECT WEATHER / CAPACITY
      
  # it "checks that a plane landing at the airport is added to the list of planes parked" do
  #   my_airport = Airport.new
  #   my_plane_a = Plane.new("Plane A","airport")
  #   my_plane_b = Plane.new("Plane B","")
  #   my_airport.park_plane(my_plane_b)
  #   expect(my_airport.which_planes_in_airport).to eq [my_plane_a, my_plane_b]
  # end
  # # UPDATE THIS TEST - can't get it to work because 
  # # it is trying to match two difference instances of my_plane_a and my_plane_b
  # # Need to use double or mock

  it "finds out which planes are in the airport" do
    my_airport = Airport.new
    my_plane_a = Plane.new("Plane A","airport")
    expect(my_airport.which_planes_in_airport).to eq [my_plane_a]
  end  
  # UPDATE THIS TEST - can't get it to work because it is trying to match
  # two difference instances of my_plane_a => Need to use double or mock


  it "looks for Plane A in the airport" do
    my_airport = Airport.new
    my_plane_a = Plane.new("Plane A","airport")
    expect(my_airport.specific_plane_in_airport?(my_plane_a)).to eq true 
  end

  it "looks for and does not find Plane E in the airport" do
    my_airport = Airport.new
    my_plane_e = Plane.new("Plane E","sky")
    expect(my_airport.specific_plane_in_airport?(my_plane_e)).to eq false 
  end

end
