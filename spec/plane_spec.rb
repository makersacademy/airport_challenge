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
  it 'should not be able to take off if flying' do
    # plane already flying when created so dont need to specify
    expect { subject.take_off }.to raise_error 'cannot take off'
  end
  it 'should be able to take off if not flying' do
    # set up test by setting flying to false
    subject.flying = false
    expect(subject.take_off).to be true
  end
  it 'changes its status to flying after taking off' do
    # set up test
    subject.flying = false
    subject.take_off
    expect(subject.flying).to be true
  end

end
