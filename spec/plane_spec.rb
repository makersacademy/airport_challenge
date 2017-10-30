require 'plane'

describe Plane do
  describe "#status" do
    it "should give me the status of the airplane" do
      expect(subject.status).to eq ("in flight")
    end

    it "should initialize with a status" do
      expect(Plane.new.status).to eq ("in flight")
    end
  end

end
