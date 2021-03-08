require 'air_traf_con'
require 'airport'
require 'plane'

describe AirTrafCon do

  it 'checks the weather which is randomly stormy' do
    allow(subject).to receive(:rand).and_return(0)
    expect(subject.weather).to eq(0)
  end

  it 'doesnt let planes takeoff in bad weather' do
    allow(subject).to receive(:rand).and_return(0)
    expect { subject.dispatch_plane }.to raise_error("Can't fly now, inclement weather")
  end

  it 'doesnt let planes land in bad weather' do
    allow(subject).to receive(:rand).and_return(0)
    expect { subject.land_plane }.to raise_error("Can't fly now, inclement weather")
  end

end
