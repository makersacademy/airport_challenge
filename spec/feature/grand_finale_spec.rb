require 'capybara/rspec'
require 'plane'
require 'airport'

# Note these are just some guidelines!
# Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

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

  let(:airport) { Airport.new }

  scenario 'plane can land at airport' do
    # airport = Airport.new
    fleet = []
    6.times { fleet << Plane.new }
  end

  scenario 'we have six planes in our fleet' do
    expect(fleet.length).to eq 6
  end

  scenario 'plan is in the air when created' do
    fleet.each do |plane|
    expect(plane.status).to eq 'flying'
  end

  scenario 'plane can take-off from airport' do
    # airport = Airport.new
    plane = airport.release_plane
    expect(plane).to be_landed
  end

  # scenario 'plane cannot land when airport is full' do
  #     airport = Airport.new # refactor this?
  #     airport.capacity.times { something }
  #     expect { airport.hangar # ?}.to raise_error 'Airport is full'
  #   end
end
end
# plane = airport.land_plane