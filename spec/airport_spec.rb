require 'airport'

describe Airport do
  it 'lands the plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
end
