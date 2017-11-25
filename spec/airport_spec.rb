require "./lib/airport"

describe Airport do
  it "allows a plane to land" do
    airport = Airport.new
    plane = double(:plane)
    airport.land(plane)
    expect(airport.planes_landed).to eq 1
  end

  # it "allows a plane to take off" do
  #
  # end
  #
  # it "allows a plane to take off then removes it from the airport" do
  #
  # end

end
