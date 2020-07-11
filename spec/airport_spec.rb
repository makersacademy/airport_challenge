require 'airport'
describe Airport do
  it 'can land a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to include(plane)
  end
  it 'can allow a plane to takeoff' do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.planes).not_to include(plane)
  end
end
