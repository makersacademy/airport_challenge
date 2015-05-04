require 'capybara/rspec'

feature 'Traffic Control' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  scenario 'planes cannot land when the airport is full' do
    allow(airport).to receive(:stormy?) { false }
    allow(airport).to receive(:full?) { true }
    expect { airport.land(plane) }.to raise_error "Airport is full"
  end

  scenario 'planes cannot land when there is a storm' do
    allow(airport).to receive(:stormy?) { true }
    expect { airport.land(plane) }.to raise_error "Cannot land during a storm"
  end

  scenario 'planes cannot take off in a storm' do
    allow(airport).to receive(:stormy?) { true }
    expect { airport.take_off(plane) }.to raise_error "Storm brewing"
  end
end