require 'airport'
require 'plane'

describe Plane do

  it "Instances of Plane should be true" do

    plane = Plane.new
    expect(plane).to eq plane

  end

end