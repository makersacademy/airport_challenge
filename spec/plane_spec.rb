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

  xit 'must get approval from airport for landing'

  it 'can land' do
    expect(plane).to respond_to :land
  end

  it 'changes its status to landed after landing' do
    expect { plane.land }.to change(plane, :status).from('flying').to('landed')
  end

  xit 'must get approval from airport for taking off'

  it 'can take off' do
    expect(plane).to respond_to :take_off
  end

  it 'changes its status to flying after taking off' do
    plane.land
    expect { plane.take_off }.to change(plane, :status).from('landed').to('flying')
  end
end
