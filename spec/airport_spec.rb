require 'airport'
require 'weather'

describe Airport do
  let(:fake_station) do
    doubled = double(:station)
    allow(doubled).to receive(:todays_weather).and_return(:sunny)
    doubled
  end

  subject(:airport) { Airport.new(fake_station) }
  let(:plane) { Plane.new }

  it "lands a flying plane" do
    airport.land(plane)
    expect(plane.landed?).to eq true
  end

  it "does not land a landed plane" do
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error("Can't land plane!")
  end

  it "does not land a taken off plane" do
    airport.land(plane)
    airport.takeoff(plane)
    expect { airport.land(plane) }.to raise_error("Can't land plane!")
  end

  it "does not land a plane if the weather is stormy" do
    allow(fake_station).to receive(:todays_weather).and_return(:stormy)
    expect { airport.land(plane) }.to raise_error("Can't land plane!")
  end

  it "does not land a plane when the airport is full" do
    Airport::MAX_CAPACITY.times { airport.land(Plane.new) }
    expect { airport.land(plane) }.to raise_error("Can't land plane!")
  end

  it "takes off a landed plane" do
    airport.land(plane)
    airport.takeoff(plane)
    expect(plane.taken_off?).to eq true
  end

  it "does not take off a flying plane" do
    expect { airport.takeoff(plane) }.to raise_error("Can't take off plane!")
  end

  it "does not take off a taken off plane" do
    airport.land(plane)
    airport.takeoff(plane)
    expect { airport.takeoff(plane) }.to raise_error("Can't take off plane!")
  end

  it "does not take off a plane if the weather is stormy" do
    airport.land(plane)
    allow(fake_station).to receive(:todays_weather).and_return(:stormy)
    expect { airport.takeoff(plane) }.to raise_error("Can't take off plane!")
  end

  it "knows flying planes are not present" do
    expect(airport.present?(plane)).to eq false
  end

  it "knows landed planes are present" do
    airport.land(plane)
    expect(airport.present?(plane)).to eq true
  end

  it "forgets planes that have taken off" do
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.present?(plane)).to eq false
  end

end
