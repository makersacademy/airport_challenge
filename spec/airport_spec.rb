require 'airport.rb'
require 'plane.rb'

describe Airport do
  it "will allow a plane to land" do
    plane = Plane.new
    expect(plane.land(plane)).to eq(plane)
  end

end
