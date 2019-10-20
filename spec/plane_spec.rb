require 'plane'
require 'airport'

describe Plane do
  it "can land" do
    plane = Plane.new
    airport = Airport.new
    expect { plane.land(airport) }.not_to raise_error
  end

  it "can take off" do
    plane = Plane.new
    airport = Airport.new
    expect { plane.take_off(airport) }.not_to raise_error
  end
end
