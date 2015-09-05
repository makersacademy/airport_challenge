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
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?

describe Plane do

  it 'has a flying status when created' do
  	plane = Plane.new
  	expect(plane).to be_flying
	end

  it 'is not flying when it is not in the air' do 
  	plane = Plane.new
  	plane.lands
  	expect(plane).to_not be_flying
  end

  it {is_expected.to respond_to(:fly_again)}

  it 'changes its status to flying after taking off' do 
  	plane = Plane.new
  	plane.lands
  	plane.fly_again
  	expect(plane).to be_flying
  end

end
