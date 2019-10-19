require 'plane.rb'
require 'airport.rb'

describe Plane do
  context "landing a plane" do

    it "lands a plane in an airport" do
      new_plane = Plane.new
      airport = Airport.new
      expect(new_plane.land(airport)).to eq("The plane has safely landed")
    end


  end


end
