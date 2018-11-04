#https://github.com/criszelaya24/airport_challenge
require 'airport_details'

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
end