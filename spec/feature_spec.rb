require 'airport'
require 'plane'
require './lib/weather'

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

context 'when weather is stormy' do
	it 'prevents departure' do 
		plane = Plane.new
		airport = Airport.new
		allow(airport).to receive(:stormy?) {false}
		airport.land(plane)
		allow(airport).to receive(:stormy?) {true}
		expect{airport.depart(plane)}.to raise_error("unsafe flying conditions to depart")

	end
end

context 'when weather is stormy' do
	it 'prevents landing' do 
		plane = Plane.new
		airport = Airport.new
		allow(airport).to receive(:stormy?) {true}
		expect{airport.land (plane)}.to raise_error("unsafe flying conditions to land")

	end
end


context 'when airport is full' do
	it 'prevents landing' do 
		plane = Plane.new
		airport = Airport.new
		allow(airport).to receive(:stormy?) {false}
		airport.capacity.times { airport.land Plane.new }
		expect{airport.land(plane)}.to raise_error("airport at capacity")

	end
end

describe  "allows capacity that can be overridden" do 
it "#capacity can be overridden" do
	airport = Airport.new
	airport.increase_capacity(15)
	expect(airport.capacity).to eq 15
	end
end


context "wehn planes are not in airport" do 
	it "prevents depatrture" do  
	airport = Airport.new
	plane = Plane.new
	allow(airport).to receive(:stormy?) {false}
	expect{airport.depart(plane)}.to raise_error "can only take off from current airport"
	end
end

context "when a plane is departed" do
	it 'status is changed to flying' do
	airport = Airport.new
	plane = Plane.new
	allow(airport).to receive(:stormy?) {false}	
	airport.land(plane)
	airport.depart(plane)
	expect(plane.flying).to eq (true)
	end
	end

context "when plane is already flying"  do 
	it "can not depart" do
	plane = Plane.new
	airport = Airport.new
	allow(airport).to receive(:stormy?) {false}
	airport.land(plane)
	allow(plane).to receive(:flying) {true}	
	expect{airport.depart(plane)}.to raise_error "plane is already flying an cannot take off"
	end
end

context "when plane is already grounded"  do 
	it "can not land" do
	plane = Plane.new
	airport = Airport.new
	allow(airport).to receive(:stormy?) {false}
	airport.land(plane)
	expect{airport.land(plane)}.to raise_error "plane is already landed and cannot land"
	end
end



describe "multiple planes depart and land" do
	it "departs and lands multiple planes" do
	fleet = []
	airport = Airport.new
	allow(airport).to receive(:stormy?) {false}
	5.times {fleet << Plane.new}
	fleet.each {|jet| airport.land(jet)}
	fleet.each do |jet|
	allow(airport).to receive(:stormy?) {false}
	airport.depart(jet)
	end
	expect(airport.planes.length).to eq 0
	end
end

