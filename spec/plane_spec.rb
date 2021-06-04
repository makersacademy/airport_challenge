require "./lib/plane.rb"

describe Plane do
  plane = Plane.new

  it "has been identified and command sent" do
    expect(plane).to respond_to(:land)
  end

  it "has been instructed to take off" do
    expect(plane).to respond_to(:take_off)
  end
  
  it "is not is the aiport anymore" do
    
  end

end
