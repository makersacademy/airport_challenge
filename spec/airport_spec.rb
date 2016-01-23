require 'airport'
require 'plane'
describe Airport do

it { is_expected.to respond_to(:land).with(1).argument }
it { is_expected.to respond_to(:depart).with(1).argument }
it { is_expected.to respond_to :stormy?}
it { is_expected.to respond_to :capacity }


	
	it '#land' do
	airport = described_class.new
	plane = Plane.new
	allow(airport).to receive(:stormy?) {false}
	airport.land(plane)
	expect(airport.planes).to include plane
	end	

	it '#depart' do
	airport = described_class.new
	plane = Plane.new
	allow(airport).to receive(:stormy?) {false}
	airport.land(plane)
	airport.depart(plane)
	expect(airport.planes).to_not include plane
	end	

	it '#depart changes a planes status to flying' do
	airport = described_class.new
	plane = Plane.new
	allow(airport).to receive(:stormy?) {false}	
	airport.land(plane)
	airport.depart(plane)
	expect(plane.flying).to eq (true)
	end


	it '#stormy?' do 
	airport = described_class.new
	allow(airport).to receive(:stormy?) {false}
	expect(airport.stormy?).to eq false
	end

	it "raises an error when plans are departed and its stormy" do
	plane = Plane.new
	airport = described_class.new
	allow(airport).to receive(:stormy?) {false}
	airport.land(plane)
	allow(airport).to receive(:stormy?) {true}
	expect{airport.depart(plane)}.to raise_error("unsafe flying conditions to depart")
	end

	it "raises an error when plans try to land and its stormy" do
	plane = Plane.new
	airport = described_class.new
	allow(airport).to receive(:stormy?) {true}
	expect{airport.land(plane)}.to raise_error("unsafe flying conditions to land")
	end

	it 'prevents landing when airport is full' do 
	plane = Plane.new
	airport = described_class.new
	allow(airport).to receive(:stormy?) {false}
	airport.capacity.times { airport.land(Plane.new) }
	expect{airport.land(plane)}.to raise_error("airport at capacity")
	end

	it "#capacity can be overridden" do
	airport = described_class.new
	plane = Plane.new
	airport.capacity=15
	allow(airport).to receive(:stormy?) {false}
	airport.capacity.times { airport.land(Plane.new) }
	expect{airport.land(plane)}.to raise_error("airport at capacity")
	end


	it "allows plane to only depart from airport it is in" do  
	plane = Plane.new
	airport = described_class.new
	allow(airport).to receive(:stormy?) {false}
	expect{airport.depart(plane)}.to raise_error "plane can only take off from airports it is in"
	end


	it "changes a planes status from flying to landed" do
	plane = Plane.new
	airport = described_class.new
	allow(airport).to receive(:stormy?) {false}
	airport.land(plane)
	allow(plane).to receive(:flying) {true}	
	expect{airport.depart(plane)}.to raise_error "plane is already flying an cannot take off"
	end


	it "prevents a plane from landing if already landed" do
	plane = Plane.new
	airport = Airport.new
	allow(airport).to receive(:stormy?) {false}
	airport.land(plane)
	expect{airport.land(plane)}.to raise_error "plane is already landed and cannot land"
	end

end