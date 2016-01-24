require 'plane'

describe Plane do 

plane = Plane.new

	it 'returns an instance of plane' do
		expect(plane).to be_a(Plane) #it creates new object id in IRB, so creates a new instance
	end

	it 'expects plane to respond to land method' do
		expect(plane).to respond_to(:land)  #it returns nil in IRB, so responds to :land
	end
end