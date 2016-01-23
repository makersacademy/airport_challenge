require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  it "confirms if landed" do
    expect(plane).to be_landed
  end

end