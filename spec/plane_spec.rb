require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it  "is instannstiaited with the name plane" do
    expect(plane.is_a?(Plane)).to eq true
  end

  it "has a changable attribute: landed" do
    expect{(plane.landed=true).to change(plane.landed).from(false).to(true)}
  end

end
