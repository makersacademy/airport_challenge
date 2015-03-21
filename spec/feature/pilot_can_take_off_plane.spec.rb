require 'capybara/rspec'

feature 'pilot can take of from airport' do
  let(:controller) { Controller.new }
  let(:airport) { Airport.new }
  scenario 'pilot take off plane from appropiate airport ' do
    expect(airport.destination).to be_true
  end

  scenario 'when is not stormy' do
    expect(controller.weather).not_to be_sunny
  end
end
