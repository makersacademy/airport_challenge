require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'Grand Finale' do

  # let(:airport) { Airport.new }
  # let(:plane) { Plane.new }
  airport = Airport.new
  6.times { plane = Plane.new }                                               # - six planes can be created

  scenario 'plane is in the air when created' do                              # - planes have a status of 'flying' when created
    expect(plane.status).to eq 'flying'
  end

  scenario 'plane can land at airport' do                                     # - planes have a status of 'landed' when at airport
    plane = airport.land_plane
    expect(plane.status).to eq 'landed'
    end

  scenario 'plane can take-off from airport' do                               # - planes have a status of 'flying' after take-off
    plane = airport.release_plane
    expect(plane.status).to eq 'flying'
  end

  # scenario 'plane cannot land when airport is full' do                      # - plane cannot land when airport capacity is reached
  #     capacity = Airport::DEFAULT_CAPACITY
  #     capacity.times { airport.land_plane }
  #     expect { airport.hangar }.to raise_error 'Airport is full'
  #   end

  scenario 'plane cannot take-off when weather is "stormy"' do                # - plane cannot take-off when weather is "stormy"
  end

  scenario 'plane cannot land when weather is "stormy" ' do                   # - plane cannot land when weather is "stormy"
  end

end
