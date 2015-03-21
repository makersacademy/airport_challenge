require 'capybara/rspec'

feature 'a plane landing' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  scenario 'is either accepted or rejected by the airport' do
    expect { airport.land plane }.to raise_error
    expect(plane.status).to be 'landed'
  end
end
