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

  it { is_expected.to be_flying }
  it { is_expected.to respond_to :land }

  subject { Plane.new('London') }


  it 'is landed after landing' do
    subject.land
    expect(subject).to be_landed
  end

  it 'can take off' do
    subject.take_off
    expect(subject).to respond_to :take_off
  end

  it 'is flying after take off' do
    subject.land
    subject.take_off
    expect(subject).to be_flying
  end

end
