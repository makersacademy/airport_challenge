require 'plane'

describe Plane do

  describe "#in_flight" do
    it "responds to in_flight" do
      expect(subject).to respond_to :in_flight
    end

    it "returns true while flying" do
      expect(subject.in_flight).to eq true
    end
  end

  describe "#landed" do
    it "can land" do
      plane = Plane.new(false)
      plane.landed
      expect(plane.in_flight).to eq false
    end
  end



end
