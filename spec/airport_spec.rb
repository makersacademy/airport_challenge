require 'airport'

describe Airport do
  it 'Can land a plane at the airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end
end
