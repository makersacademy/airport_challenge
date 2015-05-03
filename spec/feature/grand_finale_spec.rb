require 'capybara/rspec'

feature 'Grand Finale' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:weather) { Weather.new }

  scenario 'all planes can land' do
    allow(subject).to receive(:stormy?) { false }
    airport.land(plane)
    expect(plane).to be_landed
  end

  scenario 'when planes land, they are no longer flying' do
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    expect(plane.flying?).to equal false
  end

  scenario 'planes can take off' do
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    airport.take_off(plane)
    expect(plane).to be_flying
  end

  scenario 'planes cannot land when the airport is full' do
    allow(airport).to receive(:stormy?) { false }
    capacity = 10
    capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Airport is full"
  end

  scenario 'planes cannot land when there is a storm' do
    allow(airport).to receive(:stormy?) { true }
    expect { airport.land(plane) }.to raise_error "Cannot land during a storm"
  end

  scenario 'planes cannot take off when there is a storm' do
    allow(airport).to receive(:stormy?) { true }
    expect { airport.take_off(plane) }.to raise_error "Storm brewing"
  end
end
