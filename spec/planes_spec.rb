require 'planes'

describe Plane do

  describe "#name" do
    it "returns the correct name" do
      test_plane = Plane.new("Name")
      expect(test_plane.name).to eq "Name"
    end
  end

  describe "#in_air" do
    it "by default shows the plane as being on land" do
      expect(subject.in_air).to eq false
    end

    it "the planes state can be changed to show that the plane is in the air" do
      expect(subject.in_air(true)).to eq true
    end
  end

  describe "#location" do
    it "it can be updated to show its location" do
        expect(subject.set_location("In air.")).to eq "In air."
    end
  end
end
