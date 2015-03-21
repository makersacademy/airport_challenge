require 'capybara/rspec'

feature 'a plane landing' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  scenario 'changes its status to landed in safe conditions' do
    airport.stub landing_safe?: true
    airport.land plane
    expect(plane.status).to eq 'landed'
  end
end
