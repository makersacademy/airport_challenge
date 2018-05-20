require 'plane'


describe Plane do

  it "plane exists" do
    airport = Airport.new
    plane = Plane.new
    expect(subject.plane).to exist
  end

end
