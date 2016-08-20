require 'plane'

describe Plane do

  it {is_expected.to respond_to(:ground)}
  it {is_expected.to respond_to(:fly)}
  it {is_expected.to respond_to(:in_flight)}

  it "is not in flight if already landed" do
    subject.ground
    expect(subject.in_flight).to eq(false)
  end

  it "is in flight if taken off" do
    subject.fly
    expect(subject.in_flight).to eq(true)
  end

end
