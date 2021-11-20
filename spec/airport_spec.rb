require 'airport'
=begin
# User Story 1 
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
=end

# Let's test that we have class Airport
describe Airport do

	describe "#initialize" do
		it 'has an initialize method' do
			jfk = Airport.new
			expect(jfk).to be_an_instance_of(Airport)
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

	context "When full" 
	it "prevents a plane to land if the airport is full" do
		boeing = Plane.new
		jfk = Airport.new
		jfk.land(boeing)
		expect { jfk.land(Plane.new) }.to raise_error "Airport full"
	end


	
end


