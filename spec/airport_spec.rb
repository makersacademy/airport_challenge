
require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to 'land_plane' }
# end

# describe 'land plane' do
  it 'lands a plane' do
    landing = subject.land_plane
    subject.land_plane#(Plane.new)
  end
end
