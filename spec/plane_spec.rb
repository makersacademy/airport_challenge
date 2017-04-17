require 'plane'

describe Plane do

  it "defaults to be flying" do
    expect(subject.flying).to eq true
  end

  it { expect(subject).to respond_to(:land) }

  it "is not flying after #land is called" do
    subject.land
    expect(subject.flying).to eq false
  end

  it { expect(subject).to respond_to(:takeoff) }

  it "is flying after #takeoff called" do
    subject.takeoff
    expect(subject.flying).to eq true
  end

end
