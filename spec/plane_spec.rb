require 'plane'


describe Plane do
  subject(:plane) { described_class.new }

  it ":landed have a default value false" do
    expect(plane.landed).to eq(false)
  end

  it "allows reading and writing for :landed" do
    plane.landed = true
    expect(plane.landed).to eq(true)
  end



end
