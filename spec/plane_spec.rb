require "plane"

describe Plane do

  describe "#flying" do
    it "is flying" do
      expect(subject).to be_flying
    end

    it "is not flying" do
      subject.state = false
      expect(subject).not_to be_flying
    end
  end

end
