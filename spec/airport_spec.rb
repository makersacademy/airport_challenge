require_relative "../lib/airport.rb"

describe Airport do

  let(:plane) { double(:plane) }

  DEF_IDENTIFIER = "DEF"
  AIR_LOCATION = :air

  it "raises an error for a numeric identifier. Given identifier is 30" do
    expect { Airport.new(30) }.to raise_error(AirportError)
  end

  it "raises an error for a lowercase identifier. Given identifier is 'asd'." do
    expect { Airport.new('asd') }.to raise_error(AirportError)
  end

  it "raises an error if identifier given is longer than three characters. Given identifier is QWER" do
    expect { Airport.new('QWER') }.to raise_error(AirportError)
  end

  it "capacity has a default of 50." do
    expect(subject.capacity).to eq Airport::DEF_CAPACITY
  end

  it "raises error if capacity given is negative." do
    expect { Airport.new(DEF_IDENTIFIER, -20) }.to raise_error(AirportError)
  end

  it "raises error if capacity given is 0" do
    expect { Airport.new(DEF_IDENTIFIER, 0) }.to raise_error(AirportError)
  end

  it "raises error if capacity given is a float. Given capacity is 1.2 ." do
    expect { Airport.new(DEF_IDENTIFIER, 1.2).to raise_error(AirportError) }
  end

  it "raises error if capacity given is a string. Given capacity is 'qwerty'." do
    expect { Airport.new(DEF_IDENTIFIER, 'qwerty') }.to raise_error(AirportError)
  end

  it "capacity can be overriden as appropiate. Given capacity of 20." do
    expect(Airport.new(DEF_IDENTIFIER, 20).capacity).to eq 20
  end

  it "can park airplanes with a safe weather." do
    plane = double(:plane, take_off: AIR_LOCATION, land_at: DEF_IDENTIFIER)
    airport = Airport.new
    allow(airport).to receive(:safe?) { true }
    plane.take_off
    airport.park(plane)
    expect(airport.planes_parked[0]).to eq plane
  end

  it "raises error if more planes than the default capacity tries to park." do
    plane = double(:plane, take_off: AIR_LOCATION, land_at: DEF_IDENTIFIER)
    airport = Airport.new
    allow(airport).to receive(:safe?) { true }
    Airport::DEF_CAPACITY.times { airport.park(plane) }
    expect { airport.park(plane.take_off) }.to raise_error(AirportError)
  end

  it "raises error if more planes than the overriden capacity tries to park. Given capacity 80." do
    airport = Airport.new(DEF_IDENTIFIER, 80)
    plane = double(:plane, land_at: DEF_IDENTIFIER)
    allow(airport).to receive(:safe?) { true }
    80.times { airport.park(plane) }
    expect { airport.park(plane) }.to raise_error(AirportError)
  end

  it "raises error if weather is unsafe to land." do
    airport = Airport.new
    plane = double(:plane, land_at: DEF_IDENTIFIER)
    allow(airport).to receive(:safe?) { false }
    expect { airport.park(plane) }.to raise_error(AirportError)
  end

  it "raises error if weather is unsafe to take off" do
    airport = Airport.new
    plane = double(:plane, take_off: AIR_LOCATION, land_at: DEF_IDENTIFIER)
    allow(airport).to receive(:safe?) { true }
    airport.park(plane)
    allow(airport).to receive(:safe?) { false }
    expect { airport.departure(plane) }.to raise_error(AirportError)
  end

end
