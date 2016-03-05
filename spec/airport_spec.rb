require './docs/airport'

describe Airport do 

	it 'has a default capacity of 50' do
		expect(subject.capacity).to eq 50
	end

	it 'can have a different maximum capacity' do
		airport = Airport.new(30)
		expect(airport.capacity).to eq 30
	end

end