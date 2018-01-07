require "airport"
require "plane"

describe Airport do

  describe "#airstrip_land" do

    it "allows planes to land" do
      plane = Plane.new
      subject.airstrip_land(plane)
      expect(subject.hangar).to include(plane)
    end

    # it "prevents landing when weather is stormy" do
    #   expect {subject.airstrip_land}.to raise_error "No planes will land because the weather is stormy"
    # end
  end

  describe "#airstrip_take_off" do

    it "allows planes to take off" do
      plane = Plane.new
      subject.hangar << plane
      subject.airstrip_take_off(plane)
      expect(subject.hangar).to_not include(plane)
    end

    it "prevents taking off when weather is stormy" do
      plane = Plane.new
      expect { subject.airstrip_take_off(plane) }.to raise_error "No planes will take off because of the stormy weather"
    end

  end

  describe "#weather" do
    it "checks the weather" do
      obj = double()
      allow(obj).to receive(:weather).and_return("stormy")
    end
  end

end
