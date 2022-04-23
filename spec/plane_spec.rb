require 'airport'
require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it "Instances of Plane should be true" do

    expect(plane).to eq plane

  end

end
