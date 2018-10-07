require 'plane'
describe Plane do
  it "is on ground when created" do
    expect(subject.landed?).to eq true
  end
  it "plane land makes the onground variable true" do
    subject.land
    expect(subject.onground).to eq true
  end
  it "plane take off makes the onground variable false" do
    subject.take_off
    expect(subject.onground).to eq false
  end
end
