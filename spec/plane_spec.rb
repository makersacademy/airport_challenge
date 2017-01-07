require "plane.rb"

describe Plane do

  context "LANDING TESTS" do
    it "can be instructed to land" do
      expect(subject).to respond_to(:land)
    end
    it "confirms it has landed" do
      expect(subject.land).to eq true
    end
  end

  context "TAKE OFF TESTS" do
    it "can be instructed to take off" do
      expect(subject).to respond_to(:take_off)
    end
    it "confirms it has taken off" do
      expect(subject.take_off).to eq true
    end
  end

end
