require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Plane do
  it "tells me when it is landed" do
    plane = Plane.new
    plane.landed
    expect(plane).to have_attributes(:plane_status => "landed")
  end

  it "tells me when it is airborne" do
    plane = Plane.new
    plane.airborne
    expect(plane).to have_attributes(:plane_status => "airborne")
  end
end
