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
  it { is_expected.to respond_to :flying?}
  it { is_expected.to respond_to :landing?}
  it { is_expected.to respond_to :landed?}


describe '#flying?' do
   it 'is flying when created' do
    subject.flying? Plane.new
  end

  it 'can land'
    subject.reported_flying
    expect(subject).to be_flying
  end
end

describe '#landed?' do
  it 'is landed after landing' do
    subject.landed?
    expect(subject).to be_landed
  end

  it 'can take off'
    subject.landed?
    expect(subject).not_to be_flying
  end

  it 'is flying after take off'
    subject.take_off
    expect(subject).to be_flying
  end

end
