require "Plane"

describe Plane do
  describe "#flying?" do
    it "Has the method" do
      expect(subject).to respond_to(:flying?)
    end

    it "returns false when new plane initialised" do
      expect(subject.flying?).to eq(false)
    end

    it "can also return true if plane is flying" do
      subject.take_off
      expect(subject.flying?).to eq(true)
    end
  end
end
