require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes off from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?

describe Plane do

  it 'can land' do
    expect(subject).to respond_to(:lands)
  end

  it 'can fly' do
    expect(subject).to respond_to(:fly)
  end

  it 'is flying when created' do
    expect(subject.flying?).to eq true
  end

  it 'is landed after land' do
    subject.lands
    expect(subject.landed?).to eq true
  end

  it 'is flying after fly' do
    subject.fly
    expect(subject.flying?).to eq true
  end

  it 'should return false for landed? after fly' do
    subject.fly
    expect(subject).to_not be_landed
  end

  it 'should return true for landed? after land' do
    subject.lands
    expect(subject).to_not be_flying
  end
end
