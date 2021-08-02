require "plane"

describe Plane do
  it "should initialize with an attribute" do
    expect(subject).to have_attributes(flying: true)
  end

  describe "#flying? method" do
    it "should record flying attribute as flying?" do
      expect(subject.flying).to eq(subject.flying?)
    end
  end

  describe "#land method" do
    it "should change flying attribute to false after landing" do
      subject.land
      expect(subject.flying).to eq(false)
    end
  end

  describe "#take_off method" do
    it "should change flying attribute to true after taking off" do
      subject.take_off
      expect(subject.flying).to eq(true)
    end
  end
end
