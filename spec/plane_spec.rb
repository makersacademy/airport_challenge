require 'airport'

describe "Plane" do 
	
  subject(:plane) { Plane.new }

  it "checks if plane has landed or taken off" do
    expect(plane).to respond_to :landed
    expect(plane).to respond_to :taken_off
  end

  it "checks landing state" do
  	expect(plane).to respond_to :airport
  end

end