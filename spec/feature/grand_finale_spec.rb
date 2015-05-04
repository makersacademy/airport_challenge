require 'capybara/rspec'

feature 'Grand Finale' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:weather) { Weather.new }

  scenario 'all planes can land' do
    allow(airport).to receive(:stormy?) { false }
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

  scenario 'a landed plane does not respond to land' do
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error "Plane already landed"
  end

  scenario 'a flying plane does not respond to take_off' do
    allow(airport).to receive(:stormy?) { false }
    expect { airport.take_off(plane) }.to raise_error "Plane already flying"
  end

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
