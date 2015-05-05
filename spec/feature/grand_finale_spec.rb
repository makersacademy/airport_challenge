require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  # scenario 'all planes can land and all planes can take off' do
  let (:heathrow) {Airport.new}
  plane = Plane.new
  # test make 6 planes

  scenario 'can land a plane' do
    heathrow.land plane
    expect(heathrow.planes.count).to eq 1
    allow(heathrow).to receive(:weather).and_return('sunny')
    expect(plane.status).to eq 'landed'
  end

  scenario 'plane can take off' do
    allow(heathrow).to receive(:weather).and_return('sunny')
    heathrow.take_off plane
    expect(heathrow.planes.count).to eq 0
    expect(plane.status).to eq 'flying'
  end

  scenario 'traffic control' do
    allow(heathrow).to receive(:weather).and_return('sunny')
    6.times { heathrow.land Plane.new }
    expect { heathrow.land Plane.new }.to raise_error 'Airport full'
  end

  scenario 'planes cannot take_off in stormy weather' do
    allow(heathrow).to receive(:weather).and_return('stormy')
    expect{ heathrow.take_off Plane.new }.to raise_error 'Stormy cannot take_off'
  end

  scenario 'planes cannot land in stormy weather' do
    allow(heathrow).to receive(:weather).and_return('stormy')
    expect{heathrow.land Plane.new}.to raise_error 'Stormy cannot land'
  end
end


