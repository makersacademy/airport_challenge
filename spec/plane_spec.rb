require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  #1
  it "checks existance of the class Plane" do
    expect(plane.class).to eq Plane
  end

end
