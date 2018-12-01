require 'airport'

describe Airport do
  it 'responds to .land' do
    expect(subject).to respond_to(:land_plane)
  end

  it 'only allows planes to .land_plane' do
    plane = Airport.new.land_plane
    expect(plane).to be_kind_of(Plane)
  end
end
