require 'airport'
# requires the airport.rb file from lib

RSpec.describe "Airport" do
  # tests looking at the Airport class

  it "looks for a plane in the airport" do
    # arrange
    my_airport = Airport.new(20)
  
    # act
    my_airport.specific_plane_in_airport?
  
    # assert
    expect(my_airport.specific_plane_in_airport?).to eq true 
  end

  it "checks if the airport is full" do
    # arrange
    my_airport = Airport.new(20)
  
    # act
    my_airport.airport_full?
  
    # assert
    expect(my_airport.airport_full?).to eq true 
  end

  it "checks an airport's maximum capacity" do
    # arrange
    my_airport = Airport.new(20)
  
    # act
  
    # assert
    expect(my_airport.check_capacity).to eq 20
  end

  it "finds out which planes are in the airport" do
    # arrange
    my_airport = Airport.new(20)

    # act
    my_airport.which_planes_in_airport

    # assert
    expect(my_airport.which_planes_in_airport).to eq ["Plane 1"]
  end  

  it "counts how many planes are in the airport" do
    # arrange
    my_airport = Airport.new(20)
  
    # act
    my_airport.how_many_planes_in_airport

    # assert
    expect(my_airport.how_many_planes_in_airport).to eq 1
  end

  it "checks that a plane can land at the airport" do
    # arrange
    my_airport = Airport.new(20)
  
    # act
    my_airport.park_plane("Plane 2")

    # assert
    expect(my_airport.park_plane("Plane 2")).to eq true
  end

  it "checks that a plane landing at the airport is added to @planes_parked" do
    # arrange
    my_airport = Airport.new(20)
  
    # act
    my_airport.park_plane("Plane 2")

    # assert
    expect(my_airport.which_planes_in_airport).to eq ["Plane 1", "Plane 2"]
  end

  it "can change an airport's maximum capacity" do
    # arrange
    my_airport = Airport.new(20)
  
    # act
    my_airport.change_capacity(40)
  
    # assert
    expect(my_airport.change_capacity(40)).to eq true
  end

  it "changes an airport's maximum capacity to 40" do
    # arrange
    my_airport = Airport.new(20)
  
    # act
    my_airport.change_capacity(40)
  
    # assert
    expect(my_airport.check_capacity).to eq 40
  end

end
