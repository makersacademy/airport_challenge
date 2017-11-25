require 'airport'
require 'plane'

describe Airport do
  it 'can land a plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

end
