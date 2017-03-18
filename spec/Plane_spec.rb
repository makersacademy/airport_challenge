require "Plane"

describe Plane do
  describe "#flying?" do
    it "Has the method" do
      expect(subject).to respond_to(:flying?)
    end

    it "Returns true when new plane initialised" do
      expect(subject.flying?).to eq(true)
    end

    it "Can also return false if plane is grounded" do
      subject.land 
      expect(subject.flying?).to eq(false)
    end
  end
end
