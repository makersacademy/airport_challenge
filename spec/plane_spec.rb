require 'plane'



## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"




describe Plane do
	it {is_expected.to respond_to :flying?}
	it {is_expected.to respond_to :landed?}

	
  it 'has a flying status when in the air' do
  	expect(subject).to be_flying
	end


	it 'has a landed status when on the ground' do
		plane = double :plane
		allow(plane).to receive(:land) { true }
		expect(plane.land).to eq true
	end

 	it 'can take off' do
 	plane = double :plane
		allow(plane).to receive(:takeoff) { true }
  	expect(plane.takeoff).to eq true
  end
end
  #it 'changes its status to flying after taking off'

