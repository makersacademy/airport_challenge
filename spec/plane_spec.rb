require 'plane'

  #WIP - don't think this test is particularly useful?

describe Plane do
  subject(:plane) { Plane.new }
  it "confirms if not landed" do
    expect(plane.landed).to eq false
  end
end