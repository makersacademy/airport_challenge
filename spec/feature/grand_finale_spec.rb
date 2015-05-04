require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land. have them
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  # scenario 'all planes can land and all planes can take off' do
  heathrow = Airport.new
  plane = Plane.new
  # test make 6 planes

  scenario 'can land a plane' do
    heathrow.land plane
    expect(heathrow.planes.count).to eq 1
    expect(plane.status).to eq 'landed'
  end

  scenario 'plane can take off' do
    heathrow.take_off plane
    expect(heathrow.planes.count).to eq 0
    expect(plane.status).to eq 'flying'
  end

  scenario 'traffic control' do
    heathrow = Airport.new
    6.times { heathrow.land Plane.new }
    expect { heathrow.land Plane.new }.to raise_error 'Airport full'
  end

  # scenario 'planes cannot land if weather stormy' do
  #   plane = Plane.new
  #   allow(airport).to receive(:weather) { 'stormy' }
  #   heathrow = Airport.new
  #   airport.take_off plane
  #   expect(airport.take_off).to raise_error 'stormy cannot take_off'
  # end
end

# prevent airplanes landing when the weather is stormy

#Weather what method to use?
