require 'capybara/rspec'

feature 'when a plane takes off' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  scenario 'it changes its status to flying at take off' do
    allow(airport).to receive(:bad_weather?).and_return(false)
    airport.land plane
    airport.take_off plane
    expect(plane.status).to eq 'flying'
  end
end
