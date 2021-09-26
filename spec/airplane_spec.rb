require "airplane"

describe AirPlane do
  plane = AirPlane.new
  it "Check if plane exist" do
    expect(plane).to exist
  end 
  
end