require 'airport'
require 'weather_reporter'

describe 'User Stories' do
let(:airport) { Airport.new(20)}
let(:plane) { Plane.new}

  it "so planes land at airport" do
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(:plane) }.not_to raise_error
  end

  it "so planes take off from airport" do
    allow(airport).to receive(:stormy?).and_return false
    airport.land(:plane)
    expect { airport.take_off(:plane) }.not_to raise_error
  end

  it "so planes do not land when the airport is full" do
    allow(airport).to receive(:stormy?).and_return false
    20.times do
      airport.land(:plane)
  end
    expect { airport.land(:plane) }.to raise_error "Cannot land plane: airport is full"
  end

  it "so planes only take off from the airport they are at" do
    allow(airport).to receive(:stormy?).and_return false
      airport_2 = Airport.new(20)
      airport_2.land(:plane)
    expect { airport.take_off(:plane) }.to raise_error "Cannot take off plane: it is not in this airport"
  end

  it "so planes do not land when stormy" do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(:plane) }.to raise_error "Cannot land plane: weather is stormy"
  end

  it "so planes don't take off when stormy" do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.take_off(:plane) }.to raise_error "Cannot take off plane: weather is stormy"
  end
end
