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

  it 'has a flying status when created' do
  	#we create plane, it has a status set to flying.
  	#so our planes are all set to 'flying' by default.
  	#so our test is expecting 'flying' to be the status
  	#of a newly created plane
  	expect(subject.status).to eq "flying"
  end

  it 'has a flying status when in the air' do
  	#we want our planes to have a status of 'flying'
  	#once they've taken off, so we will need to include
  	#our take_off method in our expectation
  	#we expect plane.take_off to eq "flying"
  	expect(subject.take_off).to eq "flying"
  end

  xit 'can take off'

  xit 'changes its status to flying after taking off'

end
