require 'capybara/rspec'

feature 'a plane landing' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  scenario 'changes its status to landed in safe conditions' do
    allow(airport).to receive(:landing_safe?).and_return(true)
    airport.land plane
    expect(plane.status).to eq 'landed'
  end
  xscenario 'raises error when conditions are unsafe'
end
