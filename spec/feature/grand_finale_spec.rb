require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  let(:plane){Plane.new}
  let(:airport){Airport.new}

  scenario 'all planes can land' do
    airport.land(plane)
    expect(plane).to be_landed
  end

  scenario 'when planes land, they are no longer flying' do
    airport.land(plane)
    expect(plane.flying?).to equal false
  end

  scenario 'planes can take off' do
    airport.land(plane)
    airport.take_off(plane)
    expect(plane).to be_flying
  end

  scenario 'planes cannot land when the airport is full' do
    expect {airport.land(plane)}.to raise_error "Airport is full"
  end
end
