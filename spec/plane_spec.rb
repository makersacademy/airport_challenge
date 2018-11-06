require 'plane'

describe Plane do

  let(:airport) { double :airport, :arrival => true, :departure => true }

  it "can be created" do
    expect(subject).to be_a(Plane)
  end

  it "can land at an airport" do
    airport = Airport.new
    allow(airport.weather).to receive(:weather_report).and_return(:fine)

    subject.land(airport)

    expect(airport.landed_planes.first.landed?).to eq true
  end

  it "can take off from an airport" do
    subject.land(airport)
    subject.take_off(airport)

    expect(subject.flying?).to eq true
  end

  it "is no longer at an airport after take-off" do
    airport = Airport.new
    allow(airport.weather).to receive(:weather_report).and_return(:fine)

    subject.land(airport)
    subject.take_off(airport)

    expect(airport.landed_planes.size).to eq 0
  end

  it "cannot take off if the weather is stormy" do
    airport = Airport.new
    allow(airport.weather).to receive(:weather_report).and_return(:fine, :stormy)
    error = "Cannot take off, weather is stormy"

    subject.land(airport)

    expect { subject.take_off(airport) }.to raise_error(RuntimeError, error)
  end

  it "cannot land if the weather is stormy" do
    airport = Airport.new
    allow(airport.weather).to receive(:weather_report).and_return(:stormy)
    LANDING_STORMY_ERROR = "Cannot land, weather is stormy"

    expect { subject.land(airport) }.to raise_error(RuntimeError, LANDING_STORMY_ERROR)
  end

  it "cannot land if the airport is full" do
    airport = Airport.new
    allow(airport.weather).to receive(:weather_report).and_return(:fine)
    error = "Cannot land, runway is full"

    10.times { Plane.new.land(airport) }

    expect { Plane.new.land(airport) }.to raise_error(RuntimeError, error)
  end

  it "can only take off from an airport it is in" do
    airport = Airport.new
    wrong_airport = Airport.new
    allow(airport.weather).to receive(:weather_report).and_return(:fine)
    error = "Cannot take off, plane is not at this airport"

    subject.land(airport)

    expect { subject.take_off(wrong_airport) }.to raise_error(RuntimeError, error)
  end

  it "can take off if no airport is specified" do
    airport = Airport.new
    allow(airport.weather).to receive(:weather_report).and_return(:fine)

    subject.land(airport)
    subject.take_off

    expect(subject.flying?).to eq true
  end

  it "cannot take off if already flying" do
    error = "Plane is already flying"
    expect { subject.take_off(airport) }.to raise_error(RuntimeError, error)
  end

  it "cannot land if already landed" do
    subject.land(airport)
    error = "Plane has already landed"

    expect { subject.land(airport) }.to raise_error(RuntimeError, error)
  end

  it "is in an airport when landed" do
    subject.land(airport)

    expect(subject.location).to eq airport
  end

end
