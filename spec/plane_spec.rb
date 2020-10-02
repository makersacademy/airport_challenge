require 'classes'

describe Plane do
  let(:plane) { Plane.new }

  it "creates a plane" do
    expect(plane).to be_an_instance_of Plane
  end

  it "can understand that it is in air" do
    plane.flying
    expect(plane.in_air?).to be true
  end

end
