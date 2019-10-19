require 'plane'

describe Plane do
  it "can land" do
    plane = Plane.new
    expect { plane.land }.not_to raise_error
  end

  it "can take off" do
    plane = Plane.new
    expect { plane.take_off }.not_to raise_error
  end
end
