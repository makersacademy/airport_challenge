require 'plane'
require 'airport'
require 'capybara/rspec'

feature 'pilot lands the plane at airport' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  xscenario 'when weather is sunny' do
    airport.land plane
    expect(plane).not_to be_flying
  end

  xscenario 'cannot land when weather is stormy' do
    # weather = double :weather, status: :stormy
    expect { airport.land plane }.to raise_error 'Cannot land in storm'
  end
end

feature 'pilot takes off from the airport' do
  xscenario 'pilot takes off when weather is sunny' do
    airport.land plane
    plane.take_off plane
    expect(plane).to be_flying
  end

  feature '' do
  end
end
