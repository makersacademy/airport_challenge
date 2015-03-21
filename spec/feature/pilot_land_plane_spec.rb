require 'capybara/rspec'

feature "a pilot can land their plane" do
  scenario "arriving at an airport" do
    airport = Airport.new
    plane = Plane.new
    airport.arrival(plane.land)
    expect(plane).not_to be_airborne
  end
  scenario "except when the airport is full" do
    airport = Airport.new
    plane = Plane.new
    20.times { airport.arrival(plane.land) }
    expect { airport.arrival(plane.land) }.to raise_error 'Airport Full'
  end
end
