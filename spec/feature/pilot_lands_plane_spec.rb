require 'capybara/rspec'
feature 'Pilot accesses airport' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  scenario 'Plane lands at airport'  do
    landed_plane = airport.land(plane)
    status = landed_plane.status
    expect(status).to eq 'landed'
  end
  scenario 'Plane takes off from airport' do
    airport.land(plane)
    airport.take_off
    # status = flying_plane.status
    expect(plane.status).to eq 'flying'
  end
  scenario 'Plane cannot land, airport full' do
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'Airport Full'
  end
  scenario 'Plane cannot land in Airport due to storm' do
    allow(airport).to receive(:weather).and_return('stormy')
    # airport = double :airport, weather: 'stormy'
    # allow(airport).to receive(:weather).and_return('stormy')
    # airport.storm?
    # expect { airport.land(plane) }.to raise_error 'No Landing Due To Storm'
  end
  xscenario 'Plane cannot take off from Airport due to storm' # do
end

# stormy_airport = double :airport, storm?: true
#   allow(subject).to receive(:storm?) { true }
#   expect { subject.storm? }.to raise_error
#   'No Take Offs Due To Storm'
# allow(die).to receive(:roll).and_return(1, 2, 3)

# allow(Foo).to receive(:bar).with(baz).and_return(foobar_result)
