require 'capybara/rspec'

feature "a pilot can take off a plane" do
  scenario "departing from an airport" do
    airport = Airport.new
    plane = Plane.new
    airport.arrival(plane.land)
    airport.departure(plane.take_off)
    expect(plane).to be_airborne
  end
end
