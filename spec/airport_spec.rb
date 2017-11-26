require "./lib/airport"

describe Airport do
  it "allows a plane to land" do
    airport = Airport.new
    plane = double(:plane)
    airport.land(plane)
    expect(airport.planes_landed.count).to eq 1
  end

  it "allows a plane to take off" do
    airport = Airport.new
    plane = double(:plane)
    airport.land(plane)
    airport.take_off(:plane)
    expect(airport.planes_landed.count).to eq 0
  end
  #
  # it "allows a plane to take off then removes it from the airport" do
  #
  # end

end
