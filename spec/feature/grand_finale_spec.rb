require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'Grand Finale' do
  scenario 'all planes can land and all planes can take off' do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return "Sunny"
    planes = [Plane.new, Plane.new, Plane.new, Plane.new, Plane.new, Plane.new]
    planes.each { |plane| airport.land plane }
    expect(airport.planes).to eq planes
    expect(airport.planes.map(&:status).uniq).to eq [:landed]
    planes.each { |plane| airport.take_off plane }
    expect(airport.planes).to be_empty
    expect(planes.map(&:status).uniq).to eq [:flying]
  end

end
