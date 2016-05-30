require 'airport.rb'
require 'plane.rb'
# require 'Faker'


describe 'Let\'s make it \'em fly, yoo' do

	before(:each) do
		@testy_Airport = Airport.new
		@other_testy_Airport = Airport.new(3)
		@testy_Plane = Plane.new
		# let't not make it rain just yet
		allow(Weather).to receive(:good_forecast?).and_return(true)
	end

	it 'Let\'s testy_Plane to takes off from testy_Airport and land in other_testy_Airport' do
		# first land a plane in testy_airport
		@testy_Airport.arrival(@testy_Plane)
		# now lets make that plane fly!!
		expect(@testy_Airport.departure(@other_testy_Airport)).to eq "Departed to: #{@other_testy_Airport}"
		# check the status of testy_plane
		expect(@testy_Plane.instance_variable_get(:@status)).to eq "Departed to: #{@other_testy_Airport}"
		# "Crew, prepare for landing.."
		expect(@other_testy_Airport.arrival(@testy_Plane)).to eq "Landed in: #{@other_testy_Airport}"
		# check the status just one more time
		expect(@testy_Plane.instance_variable_get(:@status)).to eq "Landed in: #{@other_testy_Airport}"
	end

end