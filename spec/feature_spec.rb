require 'airport'
require 'plane'
describe 'Landing a plane' do
	it 'lands a plane' do 
		plane = Plane.new
		airport = Airport.new
		allow(airport).to receive(:stormy?) {false}
		airport.land(plane)
		expect(airport.planes).to include plane
	end
end

describe 'depart plane' do
	it 'takes off a plane' do 
		plane = Plane.new
		airport = Airport.new
		allow(airport).to receive(:stormy?) {false}
		airport.land(plane)
		airport.depart(plane)
		expect(airport.planes).to_not include plane
	end
end

describe 'prevent departure when weather is stormy' do
	it 'prevents departure' do 
		plane = Plane.new
		airport = Airport.new
		allow(airport).to receive(:stormy?) {false}
		airport.land(plane)
		allow(airport).to receive(:stormy?) {true}
		expect{airport.depart(plane)}.to raise_error("unsafe flying conditions to depart")

	end
end

describe 'prevent landing when weather is stormy' do
	it 'prevents landing' do 
		plane = Plane.new
		airport = Airport.new
		allow(airport).to receive(:stormy?) {true}
		expect{airport.land(plane)}.to raise_error("unsafe flying conditions to land")

	end
end


describe 'prevent landing when airport is full' do
	it 'prevents landing when airport is full' do 
		plane = Plane.new
		airport = Airport.new
		allow(airport).to receive(:stormy?) {false}
		airport.capacity.times { airport.land(Plane.new) }
		expect{airport.land(plane)}.to raise_error("airport at capacity")

	end
end

describe  "default airport capacity that can be overridden" do 
	it "allows default airport capacity that can be overridden" do
	airport = Airport.new
	plane = Plane.new 
	airport.capacity=15
	allow(airport).to receive(:stormy?) {false}
	airport.capacity.times { airport.land(Plane.new) }
	expect{airport.land(plane)}.to raise_error("airport at capacity")
	end
end

describe "planes can only take off from airports they are in" do 
	it "allows plane to only depart from airport it is in" do  
	airport = Airport.new
	plane = Plane.new
	allow(airport).to receive(:stormy?) {false}
	expect{airport.depart(plane)}.to raise_error "plane can only take off from airports it is in"
	end
end

describe "departing an airport changes a planes status to flying" do
	it '#depart changes a planes status to flying' do
	airport = Airport.new
	plane = Plane.new
	allow(airport).to receive(:stormy?) {false}	
	airport.land(plane)
	airport.depart(plane)
	expect(plane.flying).to eq (true)
	end
	end

describe "planes that are already flying cannot takes off and/or be in an airport" do 
	it "changes a planes status from flying to landed" do
	plane = Plane.new
	airport = Airport.new
	allow(airport).to receive(:stormy?) {false}
	airport.land(plane)
	allow(plane).to receive(:flying) {true}	
	expect{airport.depart(plane)}.to raise_error "plane is already flying an cannot take off"


end
end

describe "land if they are already in an airport" do 
	it "prevents a plane from landing if already landed" do
	plane = Plane.new
	airport = Airport.new
	allow(airport).to receive(:stormy?) {false}
	airport.land(plane)
	expect{airport.land(plane)}.to raise_error "plane is already landed and cannot land"


end
end


#planes that are already flying cannot takes off and/or be in an airport; 
#raise "plane cannot take off as already flying" if airport.planes.exclude?(plane) 


#planes that are landed cannot land again and must be in an airport, etc.
#raise "plane cannot land as already at airport" if airport.planes.include?(plane)
