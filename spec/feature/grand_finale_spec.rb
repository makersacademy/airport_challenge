require 'capybara/rspec'
require'plane'

feature 'Plane seeks permission to land' do
 scenario 'Airport allocates (releases) a slot for landing' do
  plane = Plane.new
  airport_slot = plane.accepted_plane
  expect(airport_slot).to be_available

  end
end


# require 'capybara/rspec'

# ## Note these are just some guidelines!
# ## Feel free to write more tests!!

# # Given 6 planes, each plane must land.
# # Be careful of the weather, it could be stormy!
# # Check when all the planes have landed that they have status "landed"
# # Once all planes are in the air again, check that they have status "flying!"

# feature 'Grand Finale' do

#   xscenario 'all planes can land and all planes can take off'

# end



