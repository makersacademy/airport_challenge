require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'as an operational airport we want' do

  scenario 'to be able to tell a plane to land' do
    airport = Airport.new
    airport.acknowledge Plane.new
    plane = airport.approve_landing
    expect(plane).not_to be_landed
  end

  scenario 'not to land an already-landed plane' do
    airport = Airport.new
    expect { airport.approve_landing }.to raise_error 'Plane already landed.'
  end

  scenario 'to be able to tell a plane to take off' do
    # airport = Airport.new
    plane = Plane.new
    plane.land
    # plane = airport.take_off
    expect(plane).to be_landed
    # landed_plane = airport.land(plane)
    # expect(landed_plane).to respond_to airport.take_off
  end

end
