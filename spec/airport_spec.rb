require_relative "../lib/airport.rb"

describe Airport do

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
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "raises error if capacity given is negative." do
    expect { Airport.new("NIL", -20) }.to raise_error(AirportError)
  end

  it "raises error if capacity given is 0" do
    expect { Airport.new("NIL", 0) }.to raise_error(AirportError)
  end

  it "capacity can be overriden as appropiate. Given capacity of 20." do
    expect(Airport.new("NIL", 20).capacity).to eq 20
  end

  it "can park airplanes." do
    plane = Plane.new
    plane.departure
    subject.park(plane)
    expect(subject.planes_parked[0]).to eq plane
  end

  it "raises error if more planes than the default capacity tries to park." do
    Airport::DEFAULT_CAPACITY.times { subject.park(Plane.new.departure) }
    expect { subject.park(Plane.new.departure) }.to raise_error(AirportError)
  end

  it "raises error if more planes than the overriden capacity tries to park" do
    airport = Airport.new("NIL", 80)
    80.times { airport.park(Plane.new.departure) }
    expect { airport.park(Plane.new.departure) }.to raise_error(AirportError)
  end

end
