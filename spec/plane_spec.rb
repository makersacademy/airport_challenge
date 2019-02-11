require 'plane.rb'

describe Plane do
  it "responds to #land" do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end

  it "doesn't allow landings when full" do
    airport = Airport.new
    plane = Plane.new
    expect{plane.land}.to raise_error("Cannot land when airport is full")
  end
end
