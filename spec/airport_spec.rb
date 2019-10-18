require 'airport'

describe Airport do
  it 'creates and instance of Airport' do
    expect(subject).to be_an_instance_of Airport
  end

  it 'allows a plane to land at airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subect.land(plane)).to inlude plane
  end
end