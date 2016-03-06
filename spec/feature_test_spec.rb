require 'airport'

describe 'Feature Test' do
    airport = Airport.new
    plane = Plane.new
    plane1 = Plane.new
    plane2 = Plane.new

    before do
      allow(plane).to receive(:flying) {true}
      allow(plane1).to receive(:flying) {true}
      allow(plane2).to receive(:flying) {true}
      allow(airport.weather).to receive(:stormy?) {false}
      airport.land(plane)
      airport.land(plane1)
      airport.land(plane2)
    end

  it 'instructs 3 different planes to land at airport' do
    expect(airport.planes.size).to eq 3
  end

  it 'instructs correct plane to take off' do
    airport.take_off(plane1)
    expect(plane1.flying).to be true
  end

end