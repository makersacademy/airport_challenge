require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'Grand Finale' do

  # let(:airport) { Airport.new }
  # let(:plane) { Plane.new }
  airport = Airport.new
  plane = Plane.new # 6.times

  scenario 'plane is in the air when created' do
    expect(plane.status).to eq 'flying'
  end

  scenario 'plane can land at airport' do
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
    airport.land plane
    expect()

  # scenario 'plane cannot land when airport is full' do
  #     capacity = Airport::DEFAULT_CAPACITY
  #     capacity.times { airport.land_plane }
  #     expect { airport.hangar }.to raise_error 'Airport is full'
  #   end

  scenario 'plane cannot take-off when weather is "stormy"' do
  end

  scenario 'plane cannot land when weather is "stormy" ' do
  end

end
