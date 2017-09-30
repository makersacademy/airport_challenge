require 'plane'

describe Plane do
  it "is flying or not" do
    expect(subject.flying).to eq(true)
  end
  it "stops flying when grounded" do
    subject.ground
    expect(subject.flying).to eq(false)
  end
end
