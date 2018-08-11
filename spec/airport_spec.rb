require 'airport'

describe Airport do
  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
end
