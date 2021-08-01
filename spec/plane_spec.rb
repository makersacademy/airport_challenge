require "plane"

describe Plane do
  it "should initialize with an attribute" do
    expect(subject).to have_attributes(flying: false)
  end

  describe "#landed method" do
    it "should change flying attribute after landing" do
      subject.landed
      expect(subject.flying).to eq(false)
    end
  end

  describe "#in_flight method" do
    it "should change flying attribute after taking off" do
      subject.in_flight
      expect(subject.flying).to eq(true)
    end
  end
end
