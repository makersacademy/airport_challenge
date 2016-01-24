require 'plane'

describe Plane do 

	it 'returns an instance of plane' do
		plane = Plane.new
		expect(plane).to be_a(Plane)
	end
end
