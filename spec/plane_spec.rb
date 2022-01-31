require './lib/plane'

describe Plane do
  it "should return plane" do
    plane = Plane.new
    expect(plane).to eq plane
  end
end 
