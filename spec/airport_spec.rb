require './lib/airport'

describe Airport do
  it 'allows planes to land' do
    airport = Airport.new
    plane = Plane.new
    subject.land(plane)
    expect(subject.capacity).to include(plane)
  end
end
