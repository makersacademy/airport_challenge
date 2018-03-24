require "plane"

describe Plane do
  let(:plane) { described_class.new }

  it "has a default name" do
    expect(plane.name).to eq Plane::DEFAULT_PLANE_NAME
  end

  it "name can be set on creation" do
    plane_747 = Plane.new("747")
    expect(plane_747.name).to eq "747"
  end

end
