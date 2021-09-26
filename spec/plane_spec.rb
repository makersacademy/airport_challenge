require 'plane'

describe Plane do
  subject { Plane.new }
  let(:airport) { double(:airport) }
  it { is_expected.to respond_to(:in_airport?) }
  
  it "should be in airport if airport has just accepted plane" do
    allow(airport).to receive(:planes).and_return([subject])
    expect(subject.in_airport?(airport)).to eq true
  end

  it "should not think it's in airport when airport doesn't have that plane" do
    allow(airport).to receive(:planes).and_return([])
    expect(subject.in_airport?(airport)).to eq false

  end

end