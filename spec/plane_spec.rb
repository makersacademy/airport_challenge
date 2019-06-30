require './lib/plane.rb'

describe Plane do
  it "Plane should be grounded, return true"  do
    plane = Plane.new
    expect(plane.grounded?).to eq(true)
  end

end
