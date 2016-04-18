require 'plane'

describe Plane do

it {is_expected.to respond_to :grounded?}
it {is_expected.to respond_to :depart}
it {is_expected.to respond_to :arrive}



describe "#depart" do
    it "if a plane departs it is no longer grounded" do
      plane = Plane.new
      plane.arrive
      plane.depart
      expect(plane.grounded?).to eq false
    end
  end

describe "#rarrive" do
    it "if a plane lands it is now grounded" do
      plane = Plane.new
      plane.arrive
      expect(plane.grounded?).to eq true
    end
  end
end
