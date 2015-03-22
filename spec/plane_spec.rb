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
  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane).to have_attributes(status: 'flying')
  end

  xit 'has a flying status when in the air'

  xit 'must get approval from airport for landing'

  it 'can land' do
    expect(plane).to respond_to :land
  end

  it 'changes its status to landed after landing' do
    expect { plane.take_off }.to change(plane, :status).from(flying).to(landed)
  end

  xit 'must get approval from airport for taking off'

  it 'can take off' do
    expect(plane).to respond_to :take_off
  end

  xit 'changes its status to flying after taking off'
  # expect { object.action }.to change(object, :value).from(old).to(new)
end
