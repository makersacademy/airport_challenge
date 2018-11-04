#https://github.com/criszelaya24/airport_challenge
require 'airport_details'

describe Status do
	context 'Status to know if is possible to land at the airport' do
		it 'Permission to land at the airport' do
			status = Status.new
			expect(status.land).to eq true
		end
	end
end