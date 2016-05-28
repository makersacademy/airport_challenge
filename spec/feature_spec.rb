require 'airport.rb'
require 'plane.rb'
# require 'Faker'


describe 'Feature testing' do

	before(:each) do
		@testyAirport = Airport.new(3)
		@testyPlane = Plane.new
	end

	it 'Checks it\'s an airport' do
		expect(@testyAirport.class).to eq Airport
	end

	it 'Checks it\'s a plane' do
		expect(@testyPlane.class).to eq Plane
	end

	it 'testyPlane takes off' do
		expect{@testyPlane.take_off("airport")}.to raise_error("Can only take off from an airport")
		# expect).to raise_error("Can only take off from an airport")
		p @testyPlane.take_off(@testyAirport)
	end
end
