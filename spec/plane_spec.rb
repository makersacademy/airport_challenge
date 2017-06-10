require 'plane'

describe Plane do
  it { is_expected.to be_a(Plane) }
  it { is_expected.to respond_to(:grounded?)}

  describe "#grounded?" do
    it "returns true when the plane is at an airport" do
      subject.grounded = true
      expect(subject).to be_grounded
    end

    it "returns false when the plane is not at an airport" do
      subject.grounded = false
      expect(subject).to_not be_grounded
    end
  end
end
