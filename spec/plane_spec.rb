require 'plane'
require 'airport'

describe Plane do
  it "checks if plane is at airport" do
    my_airport = Airport.new
    allow(my_airport.send(:weather)).to receive(:stormy?) { false }
    my_plane = Plane.new
    my_airport.send(:planes) << my_plane
    my_airport.take_off(my_plane)
    expect(my_airport.send(:planes).include?(my_plane)).to eq(false)
  end
end
