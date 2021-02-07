require "airport"

describe Airport do
	it "has a default capacity" do 
		airport = Airport.new
		expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
	end

 describe '#land' do	
 it "Airport responds to land" do
 	airport = Airport.new
 	expect(airport).to respond_to(:land).with(1).argument
 end
 # it "Airport responds to plane" do
 # 	airport = Airport.new
 # 	plane = Plane.new
 # 	expect(airport).to respond_to(:plane)
 # end
 it "Airport lands the plane" do
 	airport = Airport.new
 	plane = Plane.new
 	expect(airport.land(plane)).to eq [plane]
 end
 it "raises an error when airport is full" do
 	airport = Airport.new
 	plane = Plane.new
 	airport.capacity.times {airport.land(Plane.new)}
 	# Airport::DEFAULT_CAPACITY.times do
 	# 	airport.land(Plane.new)
 	# end
 	# 20.times {airport.land(Plane.new)}
 	expect {airport.land Plane.new}.to raise_error 'Airport is full: cannot land right now.'
 end
end
 # it "Airport returns a plane when called" do
 # 	airport = Airport.new
 # 	plane = Plane.new
 # 	airport.land(plane)
 # 	expect(airport.plane).to eq [plane]
 # end

end
describe '#take_off' do
 it "Airport responds to take_off" do
 	airport = Airport.new
 	plane = Plane.new
 	airport.land(plane)
 	expect(airport).to respond_to(:take_off).with(1).argument
 end
 it "should return updated hangar report when plane has taken off" do
 	airport = Airport.new
 	plane = Plane.new
 	airport.land(plane)
 	expect(airport.take_off(plane)).to_not include([plane])
 end
end
 #we need to show that a plane has taken off and is no longer present in the airport

 # it "Plane takes off from airport" do
 # 	airport = Airport.new
 # 	plane = Plane.new
 # 	expect(airport.take_off(plane)).


describe Plane do

end