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
  # as planes aren't created in the airport they must start out flying
  it 'should be in the air when created' do
    # subject makes a new instance of plane
    expect(subject.flying).to be true
  end

  xit 'has a flying status when in the air'

  xit 'can take off'
  # to take off it needs to not be flying
  # it should have a take off method
  it { is_expected.to respond_to :take_off }
  # which can't be set if already airborne
  # set the plane to not be flying
  # subject.flying = false
  # it needs to be launched from an airport

  # it needs an airport to land at
  # check airport status
  # so first put it in the airport
  # then try and have it take off so it is in the air
  # make a dummy airport to hold the plane
  # the plane should know it has taken off

  xit 'changes its status to flying after taking off'

end
