require 'Airport'
require 'Plane'

describe Airport do



	describe '#land' do

	#instruct a plane to land and confirm landed
	it 'instructs a plane to #land' do
	plane = Plane.new
	subject.land(plane)
	expect(subject.land(plane)).to eq "The plane has just landed"

	end 

	#has a new plane when landed

	it 'has a plane when landed' do
	plane = Plane.new
	subject.land(plane)
	expect(subject.planes).to include plane
	end 

	#no landing when stormy

	it 'does not allow landing when stormy' do

	end 

	#no landing when airport full

	it 'does not allow landing when airport full' do
	end 

end 
	describe '#takeoff' do

	#instruct a plane to takeoff and reports it
	it 'instructs a plane to #takeoff' do

	plane = Plane.new
	subject.takeoff(plane)
	expect(subject.takeoff(plane)).to eq "The plane has now just departed"


	end 

	#no longer has the new plane when landed

	it 'does not have the new plane after take off' do
	plane = Plane.new
	subject.takeoff(plane)
	expect(subject.planes).to_not include plane
	end 

	#no takeoff when stormy

	it 'does not allow takeoff when stormy' do
	end 

	#no takeoff when airport full

	it 'does not allow takeoff when airport full' do
	end 

end 

end 
