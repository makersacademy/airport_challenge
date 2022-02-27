require 'airport'
require 'plane'

describe Airport do
  it "should respond to the :land_plane method" do
    airport = Airport.new
    expect(airport).to respond_to(:land_plane)
  end
  it "should return a Plane instance when :land_plane is called on an Airport" do
    expect(subject.land_plane).to be_instance_of(Plane)
  end
end
