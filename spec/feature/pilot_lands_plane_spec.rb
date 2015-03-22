require 'capybara/rspec'
feature 'Pilot accesses airport' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  scenario 'Pilot lands at airport' do
    plane = airport.land(plane)
    expect(airport.planes).to be plane
  end
  scenario 'Pilot takes off from airport' do
    airport.land(plane)
    plane = airport.take_off
    expect(plane).to be plane
  end
  scenario 'Plane cannot land, airport full' do
    10.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'Airport Full'
  end
end
