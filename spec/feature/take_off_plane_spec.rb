require 'capybara/rspec'

feature 'when a plane takes off' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  scenario 'it changes its status to flying at take off' do
    airport.take_off plane
    expect(plane.status).to eq 'flying'
  end
end
