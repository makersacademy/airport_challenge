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
    expect(plane.flying_status).to eq 'Flying'
  end

  # it 'has a flying status when in the air' do
  #   plane.land
  #   expect(plane.flying_status).to eq 'Landed'
  # end

  # it 'can land' do
  #   plane.land
  #   expect(plane).to be_landed
  # end

  # it 'can take off' do
  #   plane.land
  #   plane.take_off
  #   expect(plane).not_to be_landed
  # end

  # it 'changes its status to flying after taking off' do
  #   plane.land
  #   plane.take_off
  #   expect(plane.flying_status).to eq 'Flying'
  # end

  # it 'plane cannot take off if already flying' do
  # expect { plane.take_off }.to raise_error 'Plane is already in the air'
  # end
end
