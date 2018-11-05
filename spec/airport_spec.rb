require './lib/airport'

describe Airport do
  subject { Airport.new }

  it 'allows planes to land' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.hangar).to include(plane)
  end

  it 'allows planes to take off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.hangar).not_to include(plane)
  end
end
