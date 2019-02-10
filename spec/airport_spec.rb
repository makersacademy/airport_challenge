require 'airport.rb'
require 'plane.rb'

describe Airport do
  it "responds to #takeoff" do
    airport = Airport.new
    expect(airport).to respond_to(:takeoff)
  end

  it "after #takeoff, confirms plane is not there" do
    airport = Airport.new
    airport.takeoff
    expect(airport.planes.count).to eq(0)
  end

  it "responds to #weather" do
    airport = Airport.new
    expect(airport).to respond_to(:weather)
  end
end
