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
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?

describe Plane do

  # before(:example) do
  #   plane = Plane.new
  # end

  plane = Plane.new

  it 'is flying when created' do
    expect(plane.flying).to eq(true)
  end

  it { is_expected.to respond_to :land }

  it 'is landed after landing' do
    plane.land
    expect(plane.flying).to eq(false)
  end

  it { is_expected.to respond_to :take_off }

  it 'is flying after take off' do
    plane.land
    plane.take_off
    expect(plane.flying).to eq(true)
  end

end
