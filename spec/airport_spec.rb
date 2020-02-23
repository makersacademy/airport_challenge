require 'airport.rb'

describe Airport do
  it "plane can land and takeoff" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    expect { airport.land(plane) }.not_to raise_error
    expect { airport.takeoff(plane) }.not_to raise_error
  end
  it "plane cannot land if already landed" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error "plane has already landed"
  end
  it "plane cannot takeoff if not in airport" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    expect { airport.takeoff(plane) }.to raise_error "plane is not in airport, can't takeoff"
  end
  it "plane leaves hanger when plane takesoff" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.hanger).not_to include(plane)
  end
  it "user receives a message the plane has taken off" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    expect(airport.takeoff(plane)).to eq "#{plane} has taken off"
  end
  it "planes cannot land when airport is full" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    Airport::DEFAULT_CAPACITY.times { airport.land Plane.new }
    expect { airport.land(Plane.new) }.to raise_error "airport is full, cannot land plane"
  end
  it "plane cannot land if stormy" do
    airport = Airport.new
    allow(airport).to receive(:randomnumber) { 10 }
    expect { airport.land(Plane.new) }.to raise_error "cannot land, weather is too stormy"

  end
  it "plane cannot takeoff if stormy" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    allow(airport).to receive(:randomnumber) { 10 }
    expect { airport.takeoff(plane) }.to raise_error "cannot takeoff, weather is too stormy"
  end
end
