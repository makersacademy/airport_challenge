require 'plane'

describe Plane do
  it 'plane lands in airport' do
    plane = Plane.new
    expect(plane.plane_land).to eq true
  end
end
