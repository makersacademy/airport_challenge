require 'plane'
require 'capybara/rspec'

feature 'plane location' do
  scenario 'plane has landed in airport' do
    plane = Plane.new
    expect(plane.landed?).to eq true
  end
  scenario 'plane has taken off' do
    plane = Plane.new
    expect(plane.taken_off).to eq false
  end
  scenario 'plane cannot land' do
    plane = Plane.new
    expect(plane.airport.no_clearance)
  end
end
