require 'capybara/rspec'

feature "a pilot can take off a plane" do
  scenario "the plane can take off from an airport" do
    airport = Airport.new
    plane = Plane.new
    airport.arrival(plane)
    airport.departure(plane)
    expect(plane).to be_flying
  end
end
