require 'capybara/rspec'

feature 'pilot can land plane' do
  let(:controller) { Controller.new }
  let(:airport) { Airport.new }

  scenario 'pilot land in appropiate airport' do
    expect(airport.destination).to be_true
  end

  scenario 'pilot can land plane in sunny day' do
    expect(controller.weather).to be_sunny
  end

  scenario 'pilot can land plane when airport is not full' do
    expect(airport.capacity).not_to be_full
  end
end
