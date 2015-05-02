require 'capybara/rspec'
require 'airport'
require 'plane'

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Air traffic outgoing' do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  scenario 'plane can take off' do
    allow(airport).to receive(:weather?).and_return('sunny')
    airport.receive plane
    airport.launch plane
    planes = airport.planes
    expect(planes.include? plane).to be false
  end

  scenario 'a plane cannot take off when there is a storm brewing' do
    allow(airport).to receive(:weather?).and_return('stormy')
    expect { airport.launch plane }.to raise_error 'plane cannot take off when storm brewing'
  end

end
