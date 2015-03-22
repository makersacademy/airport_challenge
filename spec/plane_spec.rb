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
  let(:aeroplane) { Plane.new }

  it 'can have a flying status' do
    expect(aeroplane).to respond_to :flying # why the colon?
  end

  it 'has a flying status of false, when created' do
    expect(aeroplane.flying).to eq false
  end

  it 'can take off' do
    expect(aeroplane).to respond_to :take_off
  end

  it 'changes its status to flying after taking off' do
    aeroplane.take_off
    expect(aeroplane.flying).to eq true
  end

  it 'has a flying status when in the air'

end
