require 'airport'

describe Airport do
  it 'tells plane to land' do
    expect(subject.plane_land(Plane.new)).to eq(nil)
  end

  it 'tells plane to take off' do
    expect(subject.plane_take_off(Plane.new)).to eq(false)
  end
end
