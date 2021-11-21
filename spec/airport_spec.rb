require 'airport'
=begin
# User Story 1 
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
=end

# Let's test that we have class Airport
describe Airport do
	subject(:jfk) {Airport.new}
	let(:plane) {Plane.new}

	describe "#initialize" do
		it 'has an initialize method' do
			expect(jfk).to be_an_instance_of(Airport)
		end

		it "has a default capacity of 1" do
			expect(jfk.capacity).to eq Airport::DEFAULT_CAPACITY
		end

		it "has a capacity parameter which overrides the default capacity" do
			jfk = Airport.new(100)
			100.times {jfk.land(Plane.new)}
			expect(jfk.capacity).to eq 100
		end
	end

	context "Landing the plane"
	it "has a #land method on its interface" do
		expect(subject).to respond_to(:land).with(1).argument
	end

	context "Departing the airport"
	it "has a #take_off method on its interface" do
		expect(subject).to respond_to(:take_off)
	end

	context "When Airport is full" 
	it "prevents a plane to land if the airport is full" do
		jfk.land(plane)
		expect { jfk.land(Plane.new) }.to raise_error "Airport full"
	end

	describe "#stormy?" do

		it "has a #stormy? method" do
			expect(jfk).to respond_to(:stormy?)
		end

	end

	
end


