require 'airport'
require 'plane'

describe Plane do

  it "should not be in an airport if flying" do
    plane = Plane.new
    # plane is in flight upon creation
    expect(plane.airport).not_to be_an_instance_of(Airport)
  end

end
