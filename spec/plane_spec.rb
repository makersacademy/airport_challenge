require 'airport'

describe "Plane" do 
	
	# it "checks if plane hass parked" do 
	# 	expect(Plane.new).to respond_to :parked
 #    end
  # it "checks if planes are in the airport" do
  #   expect()

  it "checks if plane has landed or taken off" do
    expect(Plane.new).to respond_to :landed
    expect(Plane.new).to respond_to :taken_off
  end

  it "checks landing state" do
  	expect(Plane.new).to respond_to :airport
  end

end