require "plane"

# Land

describe Plane do 
  it "Should raise an error when a grounded plane is given the method 'land'" do 
    plane = Plane.new(true)
    expect { plane.land }.to raise_error("This plane is already at an airport")
  end 
end 

# Takeoff
describe Plane do
  it "Should confirm that it is no longer at the airport after takeoff" do 
    plane = Plane.new(true)
    plane.take_off
    expect(plane.grounded).to eq(false)
  end

  it "Should raise an error when a plane in flight is given the method 'take_off'" do 
    plane = Plane.new
    expect { plane.take_off }.to raise_error("This plane is already in the sky")
  end 
end 
