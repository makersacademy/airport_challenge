require "airport"

describe Airport do
  let (:airport) {Airport.new}
  let (:plane) {Plane.new}

  describe "#land" do
    it "Tests whether the method .land(plane) works" do
    expect(airport.land(plane).length).to eq(1)
    # @landed_planes = []
    end
  end

  #describe "#take_off" do


  #end

end
