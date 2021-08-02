require 'plane.rb'

describe Plane do
  it { is_expected.to be_instance_of Plane } 
  it { is_expected.to respond_to(:flying?) } 
  it { is_expected.to respond_to(:landing) } 
  it { is_expected.to respond_to(:offtake) } 

  it "should initialize Plane with attribute" do
    expect(subject).to have_attributes(plane: :LX810, airborne: true)
  end

  describe "#flying?" do
    it "records flying attribute as flying?" do
      expect(subject.flying?).to eq(subject.flying?)
    end
  end

  describe "#landing" do
    it "change flying attribute to false after landing" do
      subject.landing
      expect(subject.flying?).to eq(false)
    end
  end

  describe "#offtake" do
    it "change flying attribute to true after taking off" do
      subject.offtake
      expect(subject.flying?).to eq(true)
    end
  end
end
