require 'airport.rb'
require 'plane.rb'
# require 'Faker'


describe 'Feature testing' do

	before(:each) do
		@testy_Airport = Airport.new(3)
		@testy_Plane = Plane.new
	end

	it 'Checks it\'s an airport' do
		expect(@testy_Airport.class).to eq Airport
	end

	it 'Checks it\'s a plane' do
		expect(@testy_Plane.class).to eq Plane
	end

	it 'testyPlane takes off' do
		expect{@testy_Plane.take_off("airport")}.to raise_error("Can only take off from an airport")
		# expect).to raise_error("Can only take off from an airport")
		p @testy_Plane.take_off(@testy_Airport)
	end

	it 'lets me play about here' do 
		p @testy_Airport.arrival(@testy_Plane)
	end
end
