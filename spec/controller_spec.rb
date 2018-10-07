require 'controller'

describe Controller do
  describe "#instruct_plane_to_land" do
    it "can instruct a plane to land" do
      plane_1, airport_1 = Plane.new("BA178"), Airport.new("Heathrow")
      expect(subject.instruct_plane_to_land(plane_1, airport_1)).to eq "Landed BA178 at Heathrow!"
    end
    it "can instruct another plane to land" do
      plane_2, airport_2 = Plane.new("EZY8880"), Airport.new("Gatwick")
      expect(subject.instruct_plane_to_land(plane_2, airport_2)).to eq "Landed EZY8880 at Gatwick!"
    end
  end
  describe "#instruct_plane_to_take_off" do
    it "can instruct planes to take off" do
      expect(subject.instruct_plane_to_take_off).to eq "Taken off!"
    end
  end
end
