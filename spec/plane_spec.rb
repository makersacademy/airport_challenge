require 'plane'

describe Plane do
  subject(:plane) {Plane.new}

  it "is flying or not" do
    expect(plane.flying).to eq(true)
  end

  it "stops flying when grounded" do
    subject.ground
    expect(plane.flying).to eq(false)
  end

end
