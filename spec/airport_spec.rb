require 'airport'

describe Airport do
  it 'tells plane to land' do
    expect(subject.plane_land(Plane.new)).to eq(nil)
  end
end
