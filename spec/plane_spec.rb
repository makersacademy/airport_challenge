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

  it 'has a landed status when created' do
  	#we create plane, it has a status set to landed.
  	#so our planes are all set to 'landed' by default.
  	#so our test is expecting 'landed' to be the status
  	#of a newly created plane
  	expect(subject.status).to eq "flying"
  end

  it 'has a flying status when in the air' do
  	#we want our planes to have a status of 'flying'
  	#once they've taken off, so we will need to include
  	#our take_off method in our expectation
  	#we expect plane.take_off to eq "flying"
  	expect(subject.status).to eq "flying"
  end

  xit 'can take off' do
  	#can this plane take_off? would I need to create a
  	#test that checks whether a plane is able to fly
  	#i.e. is it in need of repair or is it already in the
  	#air?
  end

  it 'changes its status to flying after taking off' do
  	#once the plane has taken off its status will instead
  	#be "flying". So we're expecting plane.status to eq
  	#'flying' after plane.take_off
  	plane = subject.take_off
  	expect(plane).to eq "flying"
  end

end
