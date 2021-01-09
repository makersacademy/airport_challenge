require 'airport'

describe Airport do

  it "should allow plane to land in airport" do
    plane = Plane.new
    expect(subject.land(plane)[0]).to eq(plane)
  end

  # it "should allow instance of plane to take off from instance of airport" do
  #   plane = Plane.new
  #   expect(subject.take_off(plane)).to ("The plane is no longer in the airport")
  # end

end
