require 'plane'
# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"

describe Plane do

  it 'has status "flying" when created' do
    expect(subject).to be_flying
  end

  it 'can land' do
    subject.land
    expect(subject).not_to be_flying
  end

  xit 'has a flying status when in the air'

  it 'can take off' do
    subject.land
    subject.take_off
    expect(subject).to be_flying
  end

  xit 'changes its status to flying after taking off'

end
