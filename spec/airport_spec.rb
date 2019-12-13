require 'airport'

describe Airport do
  it 'expects landing planes' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end
end
