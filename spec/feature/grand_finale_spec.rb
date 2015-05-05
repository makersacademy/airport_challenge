require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'Grand Finale' do

  # let(:airport) { Airport.new }
  # let(:plane) { Plane.new }
  airport = Airport.new
  plane = Plane.new

  scenario 'plane is in the air when created' do
    expect(plane.status).to eq 'flying'
  end

  scenario 'plane can land at airport' do
    allow(airport).to receive(:weather) { 'sunny' }
    airport.land plane
    expect(airport.hangar.count).to eq 1
    expect(plane.status).to eq 'landed'
  end

  scenario 'plane can take-off from airport' do
    airport.takeoff plane
    expect(airport.hangar.count).to eq 0
    expect(plane.status).to eq 'flying'
  end

  scenario 'plane cannot land when airport is full' do
    airport = Airport.new
    allow(airport).to receive(:weather) { 'sunny' }
    6.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error 'Airport full'
  end

  scenario 'plane cannot take-off when weather is "stormy"' do
  end

  scenario 'plane cannot land when weather is "stormy" ' do
  end

end
