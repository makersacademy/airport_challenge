require 'plane'

describe Plane do
  it 'default initialization is in flight' do
    default_plane = Plane.new()
    expect(default_plane.in_flight).to eq true
  end

  it 'can be initialized in an airport' do
    heathrow = double("heathrow", :land_plane => nil)
    heathrow_plane = Plane.new(heathrow)
    expect(heathrow_plane.in_flight).to eq false
    heathrow = double("heathrow", :planes => [heathrow_plane])
    expect(heathrow.planes).to eq [heathrow_plane]
  end

  it 'lands after being cleared to land' do
    heathrow = double("heathrow", :land_plane => true)
    subject.cleared_to_land(heathrow)
    expect(subject.in_flight).to eq false
  end

end
