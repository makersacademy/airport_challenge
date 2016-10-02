require 'plane'
require 'airport'

describe Airport do
  it 'accepts a plane' do
    plane = Plane.new
    plane.land(subject)
    expect(subject.planes[0]).to eq plane
  end
end
