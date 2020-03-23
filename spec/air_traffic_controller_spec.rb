require 'air_traffic_controller'

describe AirTrafficController do
  let(:set_weather_to_clear) { allow(Weather).to receive(:now).and_return(Weather::CLEAR) }

  let(:landed_plane) do
    dbl = double(:plane1, :take_off => 'No longer at airport')
    allow(dbl).to receive(:land).and_raise('Unable to land, plane has already landed')
    dbl
  end

  let(:airborne_plane) do
    dbl = double(:plane, :land => true)
    allow(dbl).to receive(:take_off).and_raise('Unable to take off, plane is not landed')
    dbl
  end

  let(:airport) { double }
  let(:all_successful_directions) { [[landed_plane], [airborne_plane, airport], [landed_plane]] }
  let(:no_successful_directions) { [[landed_plane, airport], [airborne_plane, airport], [landed_plane]] }
  let(:some_successful_directions) { [[landed_plane], [landed_plane], [landed_plane, airport]] }
  let(:one_successful_direction) { [[landed_plane], [airborne_plane], [airborne_plane, airport]] }

  it 'can tell multiple planes to take off and land' do
    expect(subject).to respond_to(:direct_planes).with(1).argument
  end

  it 'will report when all planes were successfully directed' do
    expect(subject.direct_planes(all_successful_directions)).to eq('All planes successfully directed')
  end

  it 'will report when no planes were successfully directed, giving you the reason why' do
    expect { subject.direct_planes(no_successful_directions) }.to raise_error 'No planes directed. Plane 1 failed - Unable to land, plane has already landed'
  end

  it 'will report when some planes were successfully directed, giving you the reason why' do
    expect { subject.direct_planes(some_successful_directions) }.to raise_error '2 planes directed. Plane 3 failed - Unable to land, plane has already landed'
  end

  it 'will report when one planes were successfully directed, giving you the reason why' do
    expect { subject.direct_planes(one_successful_direction) }.to raise_error '1 plane directed. Plane 2 failed - Unable to take off, plane is not landed'
  end

  it 'warns you when you try to direct 0 planes' do
    expect { subject.direct_planes([]) }.to raise_error 'Unable to direct planes - no directions were specified'
  end
end
