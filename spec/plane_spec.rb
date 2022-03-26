require_relative '../lib/airport'
require_relative '../lib/plane'
require_relative '../lib/weather'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:weather) { Weather.new }

  it "ensures that landed planes cannot land again" do
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :sunny
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error "This plane is already in this airport"
  end

  it "ensures that planes that are flying are not currently in an airport" do
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :sunny
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).not_to include(plane)
  end

  it "ensures that planes that are already flying cannot take off from an airport" do
    allow_any_instance_of(Weather).to receive(:random_weather).and_return :sunny
    airport.land(plane)
    airport.take_off(plane)
    expect { airport.take_off(plane) }.to raise_error "This plane is currently flying"
  end
end
