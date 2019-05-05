require './docs/airport'

describe "Airport" do
  airport = Airport.new

  it "Allows a plane to land" do
    expect(airport).to respond_to(:plane_land)
  end

end
