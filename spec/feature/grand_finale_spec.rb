require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature "Fully functioning airport" do
  scenario "Planes land at the appropriate airport" do
    plane = Plane.new
    expect(plane.status).to eq "flying"
    airport = Airport.new
    expect(plane.land airport).to eq airport
    expect(plane.status).to eq "landed"
  end

  scenario "Planes can take off from the appropriate airport" do
    plane = Plane.new
    plane.status = "landed"
    airport = Airport.new
    expect(plane.take_off airport).to eq airport
    expect(plane.status).to eq "flying"
    expect(airport.launch_plane plane).to eq plane
  end

  scenario "To avoid collisions, planes cannot land when the airport is full" do
    airport = Airport.new
    6.times { airport.accept_plane Plane.new }
    plane = Plane.new
    expect { airport.accept_plane plane }.to raise_error "Airport is full"
  end

  scenario "Prevent airplanes from landing when it is stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { true }
    expect { airport.accept_plane plane }.to raise_error "Stormy weather"
  end

  scenario "Prevent airplanes from taking off when there is a storm brewing" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { true }
    expect { airport.launch_plane plane }.to raise_error "Stormy weather"
  end
end

# feature 'Grand Finale' do

#   xscenario 'all planes can land and all planes can take off'

# end
