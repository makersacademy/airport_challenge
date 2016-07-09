require 'airport'

describe Airport do
it { is_expected.to respond_to :land_plane }

it 'Land plane receives a plane'do
  plane = Plane.new
  subject.land_plane(plane)
end

end
