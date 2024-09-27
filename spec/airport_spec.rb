require "airport"
require "plane"

describe "Airport" do
  it "allows a plane to land" do
    expect(Airport.new).to respond_to(:land_plane)
  end

  it "allows a plane to take-off" do
    expect(Airport.new.take_off).to eq "The plane has left"
  end

  it "prevents landing when the airport is full" do
    airport = Airport.new(2)
    2.times { airport.land_plane(Plane.new) }
    expect { airport.land_plane Plane.new }.to raise_error "The airport is full"
  end

  it "prevents take-off when weather is stormy" do
    airport = Airport.new(2, "stormy")
    expect { airport.take_off }.to raise_error "No take-off due to poor weather"
  end

end
