require 'plane'

describe Plane do

  it "plane exists" do
    plane = Plane.new
    expect(plane).to be_an_instance_of(Plane)
  end

  it { is expected.to respond_to :at_airport? }

end
