require "plane"
require "airport"


describe Plane do
  subject(:plane) {described_class.new}

  describe "#take_off" do
    it {is_expected.to respond_to :take_off}

    it "is not allowed to take off if it is already flying" do
      expect{plane.take_off}.to raise_error "Plane can't take off, it is already flying!"
    end
  end

  describe "#land" do
    it {is_expected.to respond_to :land}

    it "is not allowed to land if it is not flying" do
      expect{plane.land}.to raise_error "Plane can't land, it isn't flying!"
    end
  end

  describe "#at_airport" do
    it {is_expected.to respond_to :at_airport}

    it "can't be at the airpott if it is already flying" do
      expect{plane.at_airport}.to raise_error "Plane can't be at the aiport, it is already flying!"
    end
  end
end
