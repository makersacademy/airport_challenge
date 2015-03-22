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
  xscenario 'Plane cannot land, airport full' # do
  #   10.times { airport.land(plane) }
  #   expect { airport.land(plane) }.to raise_error 'Airport Full'
  # end
  xscenario 'Plane cannot land in Airport due to storm' # do
  xscenario 'Plane cannot take off from Airport due to storm' # do
end
