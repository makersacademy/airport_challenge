require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'Pilot can land his plane at airport'do
  scenario 'airport accepts request to land flying plane and lands plane'do
    airport = Airport.new
    plane = Plane.new
    airport.approves_landing plane
    expect(airport).not_to be_stormy
    expect(plane).to be_flying
  end

  scenario 'airport allows plane to take off if not stormy'do
    airport = Airport.new
    airport.approves_landing Plane.new # assumes airport empty at start
    plane = airport.approves_take_off
    expect(airport).not_to be_stormy
end

   scenario 'planes cannot land if airport is full'do
    airport = Airport.new
    capacity = airport::capacity
    capacity.times {airport.approves_landing Plane.new}
    expect {airport.approves_landing Plane.new}.to raise_error 'Airport is full'
  end

  scenario 'planes are considered to be flying unless landed'do
    plane = Plane.new
    plane.landed
    expect(plane).not_to be_flying
  end
end
