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

  # 'has a flying status when created' do
  # which would be an attr_reader :status
  it { is_expected.to respond_to :flying }
  # I'll start with new planes flying into our 'airspce'
  it 'should be in the air when created' do
    # subject makes a new instance of plane
    expect(subject.flying).to be true
  end

  xit 'has a flying status when in the air'

  xit 'can take off'
  # check airport status

  xit 'changes its status to flying after taking off'

end
