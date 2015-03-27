require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'plane can be landed and taked off in airport' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:planes) { [] }

  scenario 'plane can land when airport is not full and sunny' do
    allow(airport).to receive(:weather) { 'Sunny' }
    plane.ground
    expect(plane).not_to be_flying
  end

  scenario 'plane cannot land when airport is full' do
    allow(airport).to receive(:weather) { 'Sunny' }
    Airport::CAPACITY.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'Airport is full'
  end

  scenario 'plane cannot land in stormy day' do
    allow(airport).to receive(:weather) { 'Stormy' }
    expect { airport.land(plane) }.to raise_error 'Poor weather, not transit'
  end

  scenario 'plane cannot take off if weather is stormy' do
    allow(airport).to receive(:weather) { 'Stormy' }
    expect { airport.take_off(plane) }.to raise_error 'Poor weather, not transit'
  end
end
