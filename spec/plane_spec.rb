require 'plane'

describe Plane do

  it "plane exists" do
    plane = Plane.new
    expect(plane).to be_an_instance_of(Plane)
  end

  #it { is_expected.to respond_to(:land) }

end
