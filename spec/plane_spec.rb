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
  let(:airport) { Airport.new }
  it 'has a flying status when created' do
    expect(subject.status).to eq 'flying'
  end

  it 'change state to landed' do
    # airport = double :airport, planes:
    subject.land
    expect(subject.status).to eq 'landed'
  end
  xit 'has a flying status when in the air'

  # it 'can take off' do
  #   subject.take_off
  #   expect(subject.status).to eq 'taking off'
  # end

  it 'changes its status to flying after #taking off' do
    subject.take_off
    expect(subject.status).to eq 'flying'
  end
end
