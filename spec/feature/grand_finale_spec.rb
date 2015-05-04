require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'Grand Finale' do

  # let(:airport) { Airport.new }
  # let(:plane) { Plane.new }
  airport = Airport.new
  6.times { plane = Plane.new }

  scenario 'plane is in the air when created' do
    expect(plane.status).to eq 'flying'
  end

  scenario 'plane can land at airport' do
    plane = airport.land_plane
    expect(plane.status).to eq 'landed'
  end

  scenario 'plane can take-off from airport' do
    plane = airport.release_plane
    expect(plane.status).to eq 'flying'
  end

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
