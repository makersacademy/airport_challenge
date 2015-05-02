require 'capybara/rspec'
require 'plane'
require 'airport'

# Note these are just some guidelines!
# Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  scenario 'plane can land at airport' do
    airport = Airport.new
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
    airport = Airport.new
    plane = airport.release_plane
    expect(plane).to be_landed
  end

end
end
# plane = airport.land_plane