require 'airport.rb'

describe Airport do
 	
	it 'has a default capacity' do 
		expect(Airport::DEFAULT_CAPACITY).to be > 0
	end

end