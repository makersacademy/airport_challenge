require 'plane'

describe Plane do
  describe "#initialize" do
    it "creates plane in neutral state" do
      expect(subject.flight).to eq(nil)
    end
  end

  describe "#landed" do
    it "changes flight state to false" do
      expect(subject.landed).to eq(false)
    end
  end

  describe "#takeoff" do
    it "changes flight state to true" do
      expect(subject.takeoff).to eq(true)
    end
  end

end
