require 'capybara/rspec'
feature 'Pilot accesses airport' do
  scenario 'Pilot lands at airport' do
    plane = Plane.new
    airport = Airport.new
    # response = airport.request_landing(plane)
    plane = airport.land(plane)

    expect(airport.planes).to be [plane]
  end
end
