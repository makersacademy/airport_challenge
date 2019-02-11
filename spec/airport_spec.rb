require "./lib/airport"
require "./lib/plane"

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it { is_expected.to respond_to(:planes_in_airport) }

  it "has no planes when the plane takes off" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes_in_airport).to eq([])
  end

  it { is_expected.to respond_to(:stormy?) }

  it "the weather is sometimes stormy" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { true }
    expect(airport.stormy?).to eq(true)
  end

  it "the weather is sometimes sunny" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    expect(airport.stormy?).to eq(false)
  end

  it "is stormy will either be true or false" do
    expect([true, false]).to include(Airport.new.stormy?)
  end

  it "raises error when asked to take off in stormy weather" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?) { false }
    airport.land(plane)
    allow(airport).to receive(:stormy?) { true }
    expect { airport.take_off(plane) }.to raise_error.with_message("Plane cannot take off.")
  end

  it "raises error when asked to land in stormy weather" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { true }
    expect { airport.land(Plane.new) }.to raise_error.with_message("Turn your plane around.")
  end

  it "won't accept more planes than its default capacity" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    Airport::DEFAULT_CAPACITY.times { airport.land }
    expect { airport.land }.to raise_error.with_message("Turn your plane around.")
  end

  it "won't accept more planes than its set capacity" do
    airport = Airport.new(10)
    allow(airport).to receive(:stormy?) { false }
    10.times { airport.land }
    expect { airport.land }.to raise_error.with_message("Turn your plane around.")
  end

  it "won't allow a plane to take off from an empty airport" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    expect { airport.take_off(Plane.new) }.to raise_error.with_message("Plane cannot take off.")
  end

  it "can land 3 planes" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    3.times { airport.land }
    expect(airport.planes_in_airport.count).to eq(3)
  end

  it "once 3 planes have landed, it can select 2 to take off" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    plane_1 = Plane.new
    plane_2 = Plane.new
    plane_3 = Plane.new
    airport.land(plane_1)
    airport.land(plane_2)
    airport.land(plane_3)
    airport.take_off(plane_1)
    airport.take_off(plane_3)
    expect(airport.planes_in_airport).to eq([plane_2])
  end

  it "won't allow a plane to take off from an empty airport" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect { airport.take_off(Plane.new) }.to raise_error.with_message("Plane cannot take off.")
  end

end
