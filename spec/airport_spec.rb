require 'airport'

describe Airport do
  it 'instructs a plane to land at the airport' do
    expect(subject.land_plane(Airplane.new)).to be_a_kind_of(Array)
  end

  it 'expects everything landed at the airport to be a Plane' do
    gatwick = Airport.new
    6.times { gatwick.land_plane(Airplane.new) }
    expect(gatwick.land_plane(Airplane.new)).to all(be_an(Airplane))
  end

  it 'expects a plane to take off from an airport and return that it has taken off' do
    expect(subject.take_off).to eq 'airplane has taken off and is no longer in the airport'
  end

  it 'tests that if we have 6 planes, 4 fly off, then we have 2 left at the airport' do
    6.times { subject.land_plane(Airplane.new) }
    4.times { subject.take_off }
    expect(subject.planes.length).to eq 2
  end
end
