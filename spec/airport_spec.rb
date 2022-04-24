require 'airport'

describe Airport do
  it 'Can land a plane at the airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
  end

  it 'Can instruct a stored plane to take off from the airport' do
    plane = Plane.new
    subject.land(plane)
    subject.depart(plane)
    expect(subject.stored_planes).to eq []
  end
end
