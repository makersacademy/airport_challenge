require "plane"

describe Plane do 
  it "can make a plane" do
    plane = Plane.new
    expect(plane).not_to be nil
  end 
  
  it "check plane is docked" do 
    plane = Plane.new
    plane.dock
    expect(plane.docked?).to eq true
  end

  it "check plane is undocked" do 
    plane = Plane.new
    plane.undock
    expect(plane.docked?).to eq false
  end

end
