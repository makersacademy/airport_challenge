require 'airport'

describe Airport do

	airport = Airport.new

	it 'returns an instance of airport' do
		expect(airport).to be_a(Airport)
	end

	it {is_expected.to respond_to(:landed?)}
	it {is_expected.to respond_to(:taken_off?)}

end





