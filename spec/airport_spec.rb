#https://github.com/criszelaya24/airport_challenge
require 'airport_details'
require 'weather'

describe Airport do
	# First test, we need to know if the plane has permission to land
	context '#Airport' do
		it 'Givin permission to land the aircraft into the airport' do
			aircraft = Airport.new
			expect(aircraft.land).to eq true
		end
	end
	# Second test, we need to give permission to the plane to take off and confirm is not longer in the airport
	# context 'Givin permission to take off the plane from the airpot' do
	# 	it 'We need to confirm if is not longer in the airport the aircraft' do
	# 		aircraft = Airport.new
	# 		aircraft.land
	# 		expect(aircraft.take_off).to eq []
	# 	end
	# end

	# # We need to raise an error to land and change the status of the aircraft because of the weather
	# context 'Change the status of the aircraft because of the weather' do
	# 	it 'Cancel the land status of the aircraft' do
	# 		weather = Weather.new
	# 		weather.stormy?
	# 		expect{weather.land}.to raise_error('You can not land the aircraft because of the storm')
	# 	end
	# end

	# 	# We need to raise an error to take off and change the status of the aircraft because of the weather
	# context 'Change the status of the aircraft because of the weather' do
	# 	it 'Cancel the take off status of the aircraft' do
	# 		weather = Weather.new
	# 		weather.stormy?
	# 		expect{weather.take_off}.to raise_error('You can not take off the aircraft because of the storm')
	# 	end
	# end

	# context 'Prevent landing aircraft when the airport is full' do
	# 	it 'Raising an error when the airport is full and some aircraft is trying to land' do
	# 		airport = Airport.new
	# 		Airport::DEFAULT_CAPACITY.times{ airport.land}
	# 		expect{airport.land}.to raise_error('You can not land the aircraft because the airport is full')
	# 	end
	# end
end