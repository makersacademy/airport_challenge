require 'classes'

describe Plane do
  let(:plane) { Plane.new }

  it "creates a plane" do
    expect(plane).to be_an_instance_of Plane
  end

end
