#https://github.com/criszelaya24/airport_challenge
require 'airport_details'

describe Weather do
	# Funtions to know how is the weather to prevent to land and take off the aircraft
	context 'Is necessary to know if is stormy' do
		it 'We need to receive a true value from this test' do
			weather = Weather.new
			expect(weather.stormy?).to eq true
		end
	end
end

describe Status do
	# First test, we need to know if the plane has permission to land
	context 'Status to know if is possible to land at the airport' do
		it 'Permission to land at the airport' do
			status = Status.new
			expect(status.land).to eq true
		end
	end
	# Second test, we need to give permission to the plane to take off and confirm is not longer in the airport
	context 'Givin permission to take off the plane from the airpot' do
		it 'We need to confirm if is not longer in the airport the aircraft' do
			status = Status.new
			expect(status.take_off).to eq true
		end
	end

	# We need to raise an error to land and change the status of the aircraft because of the weather
	context 'Change the status of the aircraft because of the weather' do
		it 'Calcel the land status of the aircraft' do
			safety = Status.new
			safety.stormy?
			expect{safety.land}.to raise_error('You can not land the aircraft because of the storm')
		end
	end

		# We need to raise an error to take off and change the status of the aircraft because of the weather
	context 'Change the status of the aircraft because of the weather' do
		it 'Calcel the take off status of the aircraft' do
			safety = Status.new
			safety.stormy?
			expect{safety.take_off}.to raise_error('You can not take off the aircraft because of the storm')
		end
	end

	context 'Prevent landing aircraft when the airport is full' do
		it 'Raising an error when the airport is full and some aircraft is trying to land' do
			airport = Status.new
			airport.full?
			expect{airport.land}.to raise_error('You can not land the aircraft because the airport is full')
		end
	end
end