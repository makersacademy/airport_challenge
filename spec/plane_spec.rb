require 'plane'

describe Plane do 

plane = Plane.new

	it 'returns an instance of plane' do
		expect(plane).to be_a(Plane) #IRB returns new object_id, so creates a new instance
	end

end