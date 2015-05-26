require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes off from the airport, the plane's status
# should become "flying"

describe Plane do

  xit 'has a flying status when created'

  it 'has a flying status when in the air' do
    expect(subject).to be_flying
  end

  xit 'can take off'

  it 'changes its status to flying after taking off' do
    subject.fly
    expect(subject.status).to eq 'flying'
  end

  it 'can land' do
    subject.land
    expect(subject.status).to eq 'landed'
  end
end