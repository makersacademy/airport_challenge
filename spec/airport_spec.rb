require_relative '../lib/airport'

describe Airport do

  it "Lets plane land in airport" do
    airport = Airport.new
    expect(airport).to respond_to(:land_plane)
  end

  it "Confirms plane has left airport" do
    airport = Airport.new
    expect(airport).to respond_to(:plane_left_airport?)
  end

end
