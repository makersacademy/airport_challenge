require './lib/plane.rb'

describe Plane do
  it "Should return false if plane has taken off"  do
    plane = Plane.new
    plane.takeoff
    expect(plane.grounded?).to eq(false)
  end

  it "Should tell retutrn true if plane landed" do
      plane = Plane.new
      plane.takeoff
      plane.land
      expect(plane.grounded?).to eq(true)
  end
end
