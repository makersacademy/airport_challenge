require "airport"
describe Airport do
  let(:airport) {
    Airport.new
  }
  let(:fake_plane) {
    double(Plane.new)
  }
  it "knows that a plane has landed" do
    airport.add(fake_plane)
    expect(airport.base).to include(fake_plane)
  end
end
