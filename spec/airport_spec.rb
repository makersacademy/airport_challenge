require './lib/airport'

describe Airport do
  it 'returns true if plan lands' do
    plane = Plane.new
    expect(subject.land_plane).to be true
  end
end