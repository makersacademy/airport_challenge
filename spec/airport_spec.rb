require 'airport'

describe "Airport" do 

	# it "lands a plane" do 
	# 	expect(Airport.new).to respond_to :land 
	# end

	# it "checks the plane has landed" do
	# 	airport = Airport.new
	# 	plane = airport.land
	# 	expect(@planes.count).to eq(1)
	# end

	# it "plane takes off" do
	#   expect(Plane.new).to respond_to :take_off
	# end
  it "cannot take off if no planes" do
  	expect {Airport.new.depart}.to raise_error("No planes")
  end

  it "plane takes off" do
    expect(Airport.new).to respond_to :depart
  end

  it "plane is no longer at the airport" do
  	airport = Airport.new
  	plane = airport.land(Plane.new)
  	expect(airport.depart).to eq false
  end


  # it "departs landed planes" do
  # 	airport = Airport.new.depart
  # 	expect(airport).to be_landed
  # end

  it "lands planes" do
  	expect(Airport.new).to respond_to(:land).with(1).argument
  	# plane = Plane.new
  	# expect(Airport.new.land(plane)).to eq plane
  end

  it "plane is landed" do
  	airport = Airport.new
  	plane = airport.land(Plane.new)
  	expect(plane.pop.airport).to eq true
  end

  it "shows planes" do
  	expect(Airport.new).to respond_to(:planes)
  end
 
end

