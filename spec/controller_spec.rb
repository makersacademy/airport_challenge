require 'controller'
require 'airport'
require 'plane'

describe Controller do
  describe "#instruct_plane_to_land" do
    it "can instruct a plane to land" do
      plane_1 = Plane.new("BA178")
      expect(plane_1.landed?).to eq false
      airport_1 = Airport.new("Heathrow")
      expect(airport_1.planes).to_not include plane_1
      expect(subject.instruct_plane_to_land(plane_1, airport_1)).to eq "Landed BA178 at Heathrow!"
      expect(airport_1.planes).to include plane_1
    end
    it "can instruct another plane to land" do
      plane_2, airport_2 = Plane.new("EZY8880"), Airport.new("Gatwick")
      expect(subject.instruct_plane_to_land(plane_2, airport_2)).to eq "Landed EZY8880 at Gatwick!"
    end
  end
  describe "#instruct_plane_to_take_off" do
    it "can instruct planes to take off" do
      airport_1 = Airport.new("Heathrow")
      plane_1 = Plane.new("BA178")
      airport_1.request_landing(plane_1)
      expect(plane_1.landed?).to eq true
      expect(subject.instruct_plane_to_take_off(plane_1, airport_1)).to eq "BA178 taken off from Heathrow!"
      expect(airport_1.planes).to_not include plane_1
    end
  end
end
