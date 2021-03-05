require 'plane'

describe Plane do
  it "is able to report its location" do
    expect(subject.location).to eq("location")
  end
  
  it "must have an origin and destination that are of the class Airport" do
    expect(subject.origin).to be_a(Airport)
    expect(subject.destination).to be_a(Airport)
  end
end
