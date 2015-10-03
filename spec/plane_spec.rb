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

  let(:double_plane) {Plane.new}

  it { is_expected.to respond_to :flying }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :land }

  it 'is flying when created' do
    expect(double_plane.flying).to eql "flying"
  end

  it 'is landed after landing' do
    double_plane.land
    expect(double_plane.flying).to eql "landed"
  end

  it 'is flying after take off' do
    double_plane.land
    double_plane.take_off
    expect(double_plane.flying).to eql "flying"
  end


end
