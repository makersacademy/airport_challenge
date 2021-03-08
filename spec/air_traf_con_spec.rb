require 'air_traf_con'
require 'airport'
require 'plane'

describe AirTrafCon do

  airport = Airport.new("O'Hare", 1)

  it 'checks the weather which is randomly stormy' do
    allow(subject).to receive(:rand).and_return(0)
    expect(subject.weather).to eq(0)
  end

  it 'doesnt let planes takeoff in bad weather' do
    allow(subject).to receive(:rand).and_return(0)
    expect(subject.dispatch_plane(airport)).to eq("Can't depart now, inclement weather")
  end

  it 'doesnt let planes land in bad weather' do
    allow(subject).to receive(:rand).and_return(0)
    expect(subject.land_plane(airport)).to eq("Can't land now, inclement weather")
  end

  xit 'doesnt let planes land in a full airport' do
    plane = Plane.new("O'Hare")
    expect(subject.land_plane(airport)).to eq("Can't land, airport full")
  end

end
