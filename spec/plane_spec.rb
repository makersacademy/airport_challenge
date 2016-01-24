require 'plane'

describe Plane do 

plane = Plane.new

	it 'returns an instance of plane' do
		expect(plane).to be_a(Plane) #IRB returns new object_id, so creates a new instance
	end

	# it 'responds to the land method' do
	# 	expect(subject).to respond_to(:land) #IRB returns nil, so responding to :land
	# end

	
	# it "is added to the array 'landed_planes', when the plane lands" do
	# 	# expect(subject.land).to be_included?(:landed_planes)
	# 	expect(@landed_planes).to include(plane.land)
	# end

end