require 'capybara/rspec'
require 'plane'

feature 'A plane comes in to land' do
  scenario 'when created, should be flying' do
    plane = Plane.new
    expect(plane.flying?).to be true
  end
  scenario 'when it lands, it should not be flying' do
    plane = Plane.new
    airport = Airport.new
    airport.land_plane(plane)
    expect(plane.flying?).to be false
  end
end
