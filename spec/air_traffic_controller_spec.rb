# Need the airport class to take in a plane
# We need an airtraffic controller to instructs airport to receive planes
require "air_traffic_controller"

describe AirTrafficController do
  it "instructs landing" do
    plane = Planes.new("Boing123")
    airport = Airport.new
    expect(subject.instruct_landing(airport, plane)).to eq ["Boing123"]
  end

  it "instructs take off" do
    plane = Planes.new("name")
    airport = Airport.new
    expect(subject.instruct_takeoff(airport, plane)).to eq plane
  end
end
