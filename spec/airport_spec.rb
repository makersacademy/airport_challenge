# Since we are doing the TDD approach we always write our tests first
# We want our tests to drive our code by pushing us to do unit tests
# Unit tests, tests each part of a method or code to test for any errors
# This keeps the program simple, easy to debug and read 

# Before we create our Airport class we first need to write a test for it 
require "airport"

describe Airport do
  it "Lands the plane" do
      this_airport = Airport.new
      expect(this_airport.land_plane).to eq "Plane landed"
  end

  it "Plane to takeoff" do
    this_airport = Airport.new
    expect(this_airport.takeoff).to eq "Plane no longer in airport"
  end

  it "Tells airport is full" do
    this_airport = Airport.new
    expect(this_airport.full?).to eq "Airport full"
  end

  it "Stops takeoff when weather stormy" do
    this_airport = Airport.new
    expect(this_airport.weather).to eq "Stop takeoff"
  end

  it "Prevents landing when weather stormy" do
    this_airport = Airport.new
    expect(this_airport.prevent_landing).to eq "Prevent landing"
  end

end 



