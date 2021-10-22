require 'airport'
require 'plane'

describe Airport do
  it 'plane lands' do
    expect(subject).to respond_to(:land)
  end

  it 'plane takes off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'confirms plane is no longer in the airport' do
    expect(subject.planes).not_to include(subject.airborne_planes)
  end
end
