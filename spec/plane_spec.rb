require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it "sets a default location upon initialization" do
    expect(plane.location).to eq "In Air"
  end
end
