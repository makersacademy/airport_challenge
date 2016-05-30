require 'Airport'

describe Airport do

#subject(:airport) {described_class.new}

  it 'has a capacity' do
   expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
end 

	describe '#land' do

	#instruct a plane to land and confirm landed
	it 'instructs a plane to #land' do
	plane = Plane.new
	subject.land(plane)

	end 

	#has a new plane when landed

	it 'has a plane when landed' do
	#plane = Plane.new
	#subject.land(plane)
	#expect(subject.planes).to include plane
	end 

	#no landing when stormy

	it 'does not allow landing when stormy' do

	end 

	#no landing when airport full

	it 'does not allow landing when airport full' do
	end 

end 
	describe '#takeoff' do

	#instruct a plane to takeoff and confirm landed
	it 'instructs a plane to #takeoff' do

	#plane = Plane.new
	#subject.takeoff(plane)


	end 

	#no longer has the new plane when landed

	it 'does not have the new plane after take off' do
	#plane = Plane.new
	#subject.takeoff(plane)
	#expect(subject.planes).to_not include plane
	end 

	#no takeoff when stormy

	it 'does not allow takeoff when stormy' do
	end 

	#no takeoff when airport full

	it 'does not allow takeoff when airport full' do
	end 

end 

end 