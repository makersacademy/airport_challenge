require "airport"
describe Airport do
  let(:airport) {
    Airport.new
  }
  let(:fake_plane) {
    double(Plane.new)
  }
  let(:plane) { Plane.new }
  let(:fake_weather) { double(Weather.new) }
  it "knows that a plane has landed" do
    allow(fake_plane).to receive(:land) { true }

    expect { airport.hello(fake_plane) }.not_to raise_error
    expect(airport.base).to include(fake_plane)
  end

  it "only registers a plan if it has landed" do
    allow(fake_plane).to receive(:land) { false }
    expect { airport.hello(fake_plane) }.to raise_error(RuntimeError)
  end

  it "knows that a plane that can and has taken off => is no longer at the airport" do
    allow(fake_plane).to receive(:land) { true }
    allow(fake_plane).to receive(:take_off) { true }
    airport.hello(fake_plane)
    airport.byebye(fake_plane)
    expect(airport.base).not_to include(fake_plane)
  end

  it "can prevent landing if the airport is full" do
    # Need a new plane every time
    Airport::DEFAULT_CAPACITY.times {
      fake_plane = double Plane.new
      allow(fake_plane).to receive(:land) { true }
      airport.hello(fake_plane)
    }
    expect { airport.hello(fake_plane) }.to raise_error(RuntimeError)
  end

  it "has a default capacity" do
    expect(Airport::DEFAULT_CAPACITY).to be 50
  end

  it "has a default capacity that can be overridden" do
    # I want to have different planes in the airport
    bigger_airport = Airport.new(100)
    allow(fake_plane).to receive(:land) { true }
    80.times {
      plane_plane = double(Plane.new)
      allow(plane_plane).to receive(:land) { true }
      bigger_airport.hello(plane_plane)
    }
    expect(bigger_airport.hello(fake_plane)).to include(fake_plane)
  end

  it "will not approve a take off if no planes in the airport" do
    allow(fake_plane).to receive(:take_off) { true }
    expect { airport.byebye(fake_plane) }.to raise_error(RuntimeError)
  end

  it "will not allow for a plane that has taken off to take off again" do
    fake_plane2 = double(Plane.new)
    allow(fake_plane).to receive(:land) { true }
    allow(fake_plane2).to receive(:land) { true }
    allow(fake_plane).to receive(:take_off) { true }
    airport.hello(fake_plane)
    airport.hello(fake_plane2)
    airport.byebye(fake_plane)
    expect { airport.byebye(fake_plane) }.to raise_error(RuntimeError)
  end

  it "will not allow a plan that has landed to land again" do
    allow(fake_plane).to receive(:land) { true }
    airport.hello(fake_plane)
    expect { airport.hello(fake_plane) }.to raise_error(RuntimeError)
  end
end
