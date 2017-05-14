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
    expect { airport.land(plane) }.to raise_error("Not this time buddy, you only land once!")
  end

  it "does not land a taken off plane" do
    plane = Plane.new(:taken_off)
    expect { airport.land(plane) }.to raise_error("Not this time buddy, you can't land a taken off plane!")
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

  it "doesn't take off a plane if the weather is stormy" do
    allow(fake_station).to receive(:todays_weather).and_return(:stormy)

    airport.land(plane)
    expect { airport.takeoff(plane) }.to raise_error("Can't take off plane!")
    expect(plane.taken_off?).to eq false
    expect(airport.present?(plane)).to eq true
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
