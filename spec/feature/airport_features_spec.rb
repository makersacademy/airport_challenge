require 'capybara/rspec'

describe 'Airport features' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  before { allow(airport.weather).to receive(:stormy?).and_return(false) }
  
  feature 'airport no longer lists plane as registered' do
    scenario 'after take off' do
      airport.clear_for_landing plane
      airport.clear_for_takeoff plane
      expect(airport.planes).not_to include plane
    end
  end

  feature 'airport has a default capacity' do
    scenario 'when initialized' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    scenario 'which has override when building new airport' do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end
  end
end
