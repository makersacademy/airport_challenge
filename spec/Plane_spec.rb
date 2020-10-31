require './lib/Plane'

describe Plane do
  it "Creates plane instances" do
    expect(Plane.new).to be_instance_of Plane
  end
end 
