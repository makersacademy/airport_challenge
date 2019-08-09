require './lib/airport'

describe Airport do
  it 'can host a plane' do
    @planes.push(Plane.new)
    expect(subject.planes).to include(plane)
  end
end

describe Airport do
  it 'can check if the plane is still there after taking off' do
    plane = Plane.new
    plane.land
    planes = []
    planes.push(plane)
    plane.takeoff
    planes.delete(plane)
    expect(planes).not_to include(plane)
end
end
