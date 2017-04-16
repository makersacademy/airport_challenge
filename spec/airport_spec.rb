require './lib/airport'
require './lib/plane'

describe Airport do

  it { is_expected.to respond_to :land}

it "created a plane and allows it to land" do

  plane = Plane.new
  subject.land(plane)
  expect(subject.landed_planes).to include plane
end

end
