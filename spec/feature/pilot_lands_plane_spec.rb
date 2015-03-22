require 'capybara/rspec'
feature 'Planes accesses airport' do
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
    # allow(airport).to receive(:weather).and_return('stormy')
    # airport.stub(:weather).and_return(10)
    # airport = double :airport, weather: 'stormy'
    # allow(airport).to receive(:weather).and_return('stormy')
    # airport.storm?
    # expect { airport.land(plane) }.to raise_error 'No Landing Due To Storm'
  end
  scenario 'Plane cannot take off from Airport due to storm' do
    airport.land(plane)
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.take_off }.to raise_error 'No Take Off Due To Storm'
  end
end

# stormy_airport = double :airport, storm?: true
#   allow(subject).to receive(:storm?) { true }
#   expect { subject.storm? }.to raise_error
#   'No Take Offs Due To Storm'
# allow(die).to receive(:roll).and_return(1, 2, 3)

# allow(Foo).to receive(:bar).with(baz).and_return(foobar_result)
