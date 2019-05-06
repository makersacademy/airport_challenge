require 'airport'
require 'plane'

describe Airport do
  it 'instructs a plane to land' do
    expect(subject).to respond_to(:land)
  end

  it 'checks landed plane is in airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it 'instructs a plane to take-off' do
    expect(subject).to respond_to(:take_off)
  end
end
