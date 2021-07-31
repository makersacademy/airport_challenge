require 'plane'
require 'airport'

describe Plane do
  it "checks if plane is at airport" do
    my_plane = Plane.new
    my_airport = Airport.new(my_plane)
    my_airport.take_off(my_plane)
    expect(my_plane.at_airport?).to eq(false)
  end
end