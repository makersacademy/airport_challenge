require 'capybara/rspec'
require 'plane'
require 'airport'

# Feature tests:

# - six planes can be created
# - planes have a status of 'flying' when created, 'landed' when at airport
# - planes have a location of 'mid-air' when flying, 'in-hangar' when landed
# - six planes can land at airport, stored in hangar
# - six planes can depart from airport
# - planes cannot take-off/land unless weather is 'sunny'
# - planes cannot land when airport is full
# - Airport knows planes are in the air/in the airport

feature 'Grand Finale' do

  # let(:airport) { Airport.new }
  # let(:plane) { Plane.new }
  airport = Airport.new
  plane = Plane.new

  scenario 'plane can land at airport' do
    expect(plane.plane_status).to eq 'landed'
    end

  # scenario 'we have six planes in our fleet' do
  #   expect(fleet.length).to eq 6
  # end

  scenario 'plane is in the air when created' do
    plane = Plane.new
    expect(plane.plane_status).to eq 'flying'
  end

  scenario 'plane can take-off from airport' do
    expect(plane.plane_status).to eq 'flying'
  #   # airport = Airport.new
  #   plane = airport.release_plane
  #   expect(plane).to be_landed
  end

  # scenario 'plane cannot land when airport is full' do
  #     airport = Airport.new # refactor this?
  #     airport.capacity.times { something }
  #     expect { airport.hangar # ?}.to raise_error 'Airport is full'
  #   end
end
# plane = airport.land_plane