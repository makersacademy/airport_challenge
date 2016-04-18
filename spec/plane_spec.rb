require "plane"
describe Plane do
  subject { Plane.new }
  it "should not be at an airport when initialized" do
    expect(subject.instance_variable_get(:@flying)).to eq true
  end

  describe "#flying?" do
    it "should return true if @flying is true" do
      expect(subject.flying?).to eq true
    end
    it "should return false if @flying is false" do
      subject.instance_variable_set(:@flying, false)
      expect(subject.flying?).to eq false
    end
  end

  describe "#land" do
    it "should set @flying as false" do
      subject.land
      expect(subject).not_to be_flying
    end
  end

  describe "#take_off" do
    it "should set @flying as true" do
      subject.land
      subject.take_off
      expect(subject).to be_flying
    end
  end
end
