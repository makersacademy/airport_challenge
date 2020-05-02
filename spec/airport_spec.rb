require 'airport.rb'
require 'plane.rb'
require 'weather.rb'

describe Airport do
  it "Plane can land at an airport" do
    airport = Airport.new
    expect(airport.land("plane0")).to eq("plane0 landed at airport")
  end

  it "Plane can take off from an airport" do
    airport = Airport.new
    airport.land("plane0")
    expect(airport.take_off).to be_instance_of Plane
  end

  # it "After take off plane is no longer at airport" do
  #   airport = Airport.new
  #   airport.land("plane0")
  #   airport_after_take_off = airport.take_off
  #   p airport_after_take_off
  #   expect(airport_after_take_off).not_to include("plane0")
  # end

  it "Plane cannot land when airport is full" do
  end

end
