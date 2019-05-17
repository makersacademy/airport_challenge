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

    expect { airport.add(fake_plane) }.not_to raise_error
    expect(airport.base).to include(fake_plane)
  end

  it "only registers a plan if it has landed" do
    allow(fake_plane).to receive(:land) { false }
    expect { airport.add(fake_plane) }.to raise_error(RuntimeError)
  end

  it "knows that a plane has taken off and is no longer at the airport" do
    allow(fake_plane).to receive(:take_off) { true }
    airport.remove(fake_plane)
    expect(airport.base).not_to include(fake_plane)
  end

  it "can prevent landing if the airport is full" do
    allow(fake_plane).to receive(:land) { true }
    50.times { airport.add(fake_plane) }
    expect { airport.add(fake_plane) }.to raise_error(RuntimeError)
  end

  it "has a default capacity" do
    expect(Airport::DEFAULT_CAPACITY).to be 50
  end

  it "has a default capacity that can be overridden" do
    #I want to have different planes in the airport
    bigger_airport = Airport.new(100)
    allow(fake_plane).to receive(:land) { true }
    80.times { 
      plane_plane = double(Plane.new)
      allow(plane_plane).to receive(:land) { true }
      bigger_airport.add(plane_plane) 
    }
    expect(bigger_airport.add(fake_plane)).to include(fake_plane)
  end
end
