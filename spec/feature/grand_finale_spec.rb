require 'capybara/rspec'

feature 'Grand Finale' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  scenario 'all planes can land and all planes can take off' do
    airport = Airport.new
    Array.new(6, Plane.new)
    allow(airport).to receive(:weather) { :'sunny' }

    planes.each { |plane| airport.land plane }
    expect(airport.planes).to eq planes
    expect(airport.planes.map { |plane| plane.status }.uniq).to eq [:landed]
    planes.each { |plane| airport.take_off plane }
    expect(airport.planes).to be_empty
    expect(planes.map { |plane| plane.status }.uniq).to eq [:flying]
  end
end
