require 'airport'
require 'plane'
require 'weather'


describe Airport do

subject(:airport) { described_class.new }
let(:plane) {double(:plane, :flying => false, :grounded => false, :fly => true)} 

before do
     allow(airport).to receive(:stormy?).and_return false
  	 allow(airport).to receive(:planes).and_return [plane]
  end	

	it '#land' do
	expect(airport.planes).to include plane
	end	

	it '#depart' do
	airport.depart(plane)
	expect(airport.planes).to_not include plane
	end	

	it "error when plans depart and stormy" do
	allow(airport).to receive(:stormy?) {true}
	expect{airport.depart(plane)}.to raise_error("unsafe flying conditions to depart")
	end

	it "error when planes land stormy" do
	allow(airport).to receive(:stormy?) {true}
	expect{airport.land(Plane.new)}.to raise_error("unsafe flying conditions to land")
	end

	it 'prevents landing when airport is full' do 
	9.times { airport.land(Plane.new) }
	expect{airport.land(Plane.new)}.to raise_error("airport at capacity")
	end

	it "#capacity can be overridden" do
	airport.increase_capacity(15)
	expect(airport.capacity).to eq 15
	end


	it "planes only depart airports they are in" do  
	expect{airport.depart(Plane.new)}.to raise_error "can only take off from current airport"
	end


	it "planes cannot depart if already flying" do
	allow(plane).to receive(:flying) {true}	
	expect{airport.depart(plane)}.to raise_error "plane is already flying an cannot take off"
	end


	it "prevents a plane from landing if already landed" do
	expect{airport.land(plane)}.to raise_error "plane is already landed and cannot land"
	end

end