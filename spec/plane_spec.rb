require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  it { is_expected.to be_an_instance_of Plane }

  it "can understand that it is in air" do
    plane.flying
    expect(plane.in_air?).to be true
  end

  it "can understand that it is grounded" do
    plane.grounded
    expect(plane.in_air?).to be false
  end

  it "is flying by default" do
    expect(plane.in_air?).to be true
  end

end
