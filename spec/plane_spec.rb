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
    expect(subject.flying?).to eq true
  end
  it 'has a flying status when in the air' do
    subject.flying?
    expect(subject).to be_flying
  end
  it 'changes its status to not flying when landing' do
    subject.ground
    expect(subject).not_to be_flying
  end

  it 'changes its status to flying after taking off' do
    subject.ground
    subject.take_off
    expect(subject).to be_flying
  end
end
