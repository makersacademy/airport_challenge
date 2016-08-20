require 'plane'

describe Plane do

  it {is_expected.to respond_to(:land)}
  it {is_expected.to respond_to(:fly)}
  it {is_expected.to respond_to(:in_flight)}

  it "is not in flight if already landed" do
    subject.land
    expect(subject.in_flight).to eq(false)
  end

end
