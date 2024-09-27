require 'plane'

describe Plane do
  it "informs when plane has taken-off" do
    plane = Plane.new
    expect(plane.leaving).to eq("Take off")
  end
  
  it "Checks plane status when is initialized" do
    plane = Plane.new
    expect(plane.landing?).to eq(false)
  end
end