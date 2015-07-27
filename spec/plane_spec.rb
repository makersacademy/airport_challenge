require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do

  it 'has a destination' do
   	plane = Plane.new "Paris"
   	expect(plane.destination).to eq "Paris" 	
  end

  it 'is flying when created' do
   	plane = Plane.new "Paris"
   	expect(plane).to be_flying
  end
  

  it 'function can_land exists' do
   	plane = Plane.new "Paris"
   	expect(plane).to respond_to :can_land
	end

	it 'can_land' do
		plane = Plane.new "Paris"
		plane.can_land
		expect {plane.can_land}.to raise_error 'the plane cannot land if it is not flying'
	end

  it 'is landed after landing' do
  	plane = Plane.new "Paris"
  	plane.can_land
  	expect(plane).to be_landed
	end
  	
  it 'function take off exists' do
  	plane = Plane.new "Paris"
  	expect(plane).to respond_to :can_take_off
  end

  it 'can take off' do
  	plane = Plane.new "Paris"
  	expect {plane.can_take_off}.to raise_error 'the plane cannot take off if it is not landed'
  end

  it 'is flying after take off' do
  	plane = Plane.new "Paris"
  	expect(plane).to be_flying
	end

end
