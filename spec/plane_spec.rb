require 'plane'

describe Plane do
  it "does not raise error when plane.land is called" do
    plane = Plane.new
    expect { plane.land }.not_to raise_error
  end
end
