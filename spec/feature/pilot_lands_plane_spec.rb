require 'capybara/rspec'
feature 'Pilot accesses airport' do
  scenario 'Pilot lands at airport' do
    plane = Plane.new
    airport = Airport.new
    plane = airport.land(plane)
    expect(airport.planes).to be plane
  end
  scenario 'Pilot takes off from airport' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    plane = airport.take_off
    expect(plane).to be plane
  end

end
