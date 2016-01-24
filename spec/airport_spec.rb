require 'airport'

describe Airport do 

	it 'returns an instance of airport' do
		airport = Airport.new
		expect(airport).to be_a(Airport)
	end
end