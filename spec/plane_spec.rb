require "plane"

describe Plane do 
  it "Should respond to the instruction to land or take off at an airport" do 
    plane = Plane.new
    expect(plane).to respond_to(:land)
    expect(plane).to respond_to(:take_off)
  end 

  it "Should confirm that it is no longer at the airport after takeoff" do 
    plane = Plane.new
    plane.take_off
    expect(plane.grounded).to eq(false)
  end
=begin
  it "Should have a default value of being grounded" do 
    plane = Plane.new
    expect(plane.grounded).to eq(true)
  end 
=end
  it "Should raise an error when a grounded plane is given the method 'land'" do 
    plane = Plane.new("grounded")
    expect { plane.land }.to raise_error("This plane is already at an airport")
  end 

  it "Should raise an error when a plane in flight is given the method 'take_off'" do 
    plane = Plane.new("in flight")
    expect { plane.take_off }.to raise_error("This plane is already in the sky")
  end 
end 
