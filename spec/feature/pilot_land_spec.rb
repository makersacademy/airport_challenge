require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'pilot can' do
  scenario 'arrive at the desired destination' do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end

  scenario 'take off from the appropriate airport' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect { plane.take_off(airport) }.to be_equal { 'Took off!' }
  end
end
