require 'plane'

describe Plane do

  it "adds a plane's id to the planes_outside_airports array when initiated" do
    plane = Plane.new
    expect($planes_outside_airports).to eq([plane.object_id])
  end

end
