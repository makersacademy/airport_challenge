require "airport"
describe Airport do
  let(:airport) {
    Airport.new
  }
  let(:fake_plane) {
    double(Plane.new)
  }
  let(:plane) {
    Plane.new
  }
  it "knows that a plane has landed" do
    allow(fake_plane).to receive(:landed) { true }

    expect { airport.add(fake_plane) }.not_to raise_error
    expect(airport.base).to include(fake_plane)
  end

  it "only registers a plan if it has landed" do
    allow(fake_plane).to receive(:landed) { false }
    expect { airport.add(fake_plane) }.to raise_error(RuntimeError)
  end
end
