require 'plane'
require 'capybara/rspec'

feature 'planes can land' do
  scenario 'plane has landed in airport' do
    plane = Plane.new
    expect(plane.landed?).to eq true
  end
end
