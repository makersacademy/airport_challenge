require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  xscenario 'all planes can land and all planes can take off'

end

feature 'Plane can' do

  let (:plane) { Plane.new }
  let (:heathrow) { Airport.new }

  scenario 'land in an airport' do
    allow(heathrow).to receive(:storm_brewing) { 'sunny' }
    heathrow.land(plane)
    expect(plane::status).to eq "landed"
  end

  scenario 'land and then take off' do
    allow(heathrow).to receive(:storm_brewing) { 'sunny' }
    heathrow.land(plane)
    heathrow.take_off(plane)
    expect(plane::status).to eq "flying"
  end

  scenario 'not land when the airport is full' do
    allow(heathrow).to receive(:storm_brewing) { 'sunny' }
    capacity = heathrow::capacity
    capacity.times {heathrow.land(plane)}
    expect {heathrow.land(Plane.new)}.to raise_error "The airport is full"
  end

  scenario 'not land when the airport is full with extended capacaity' do
    heathrow = Airport.new(5)
    allow(heathrow).to receive(:storm_brewing) { 'sunny' }
    capacity = heathrow::capacity
    capacity.times {heathrow.land(plane)}
    expect{heathrow.land(plane)}.to raise_error 'The airport is full'
  end

  scenario 'not land in bad weather' do
    allow(heathrow).to receive(:storm_brewing) { 'stormy' }
    expect{heathrow.land(plane)}.to raise_error 'Cannot land in stormy weather'
  end

  scenario 'not take off in bad weather' do
    allow(heathrow).to receive(:storm_brewing) { 'sunny' }
    heathrow.land(plane)
    allow(heathrow).to receive(:storm_brewing) { 'stormy' }
    expect{heathrow.take_off(plane)}.to raise_error 'Cannot take off in stormy weather'
  end
end