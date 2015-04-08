require 'capybara/rspec'

feature 'create airports' do
  scenario 'with variable weather' do
    airport = Airport.new(climate: 3)
    expect(airport.climate).to eq 3
  end
  scenario 'with variable capacities' do
    airport = Airport.new(capacity: 3)
    expect(airport.capacity).to eq 3
  end
end
