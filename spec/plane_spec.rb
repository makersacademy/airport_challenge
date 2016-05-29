require "plane"

describe Plane do
  describe "#flight_end" do
    it "confirms that a plane has landed" do
      subject.flight_end
      expect(subject.flying?).to be_falsey
    end
  end

  describe "#flight_start" do
    it "confirms that a plane has taken off" do
      subject.flight_start
      expect(subject.flying?).to be_truthy
    end
  end
end
