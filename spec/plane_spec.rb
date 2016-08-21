require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it {is_expected.to respond_to(:ground)}
  it {is_expected.to respond_to(:fly)}
  it {is_expected.to respond_to(:in_flight)}

  it "is not in flight if already landed" do
    plane.ground
    expect(plane.in_flight).to eq(false)
  end

  it "is in flight if taken off" do
    plane.fly
    expect(plane.in_flight).to eq(true)
  end

end
