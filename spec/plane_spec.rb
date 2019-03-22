require 'plane'
require 'airport'

describe Plane do

  it 'lands at airport' do
    ap = Airport.new
    subject.land
    ap.land_on_runway(subject)
    expect(ap.planes).to eq [subject]
  end

  it 'takes off from airport' do
    ap = Airport.new
    plane = Plane.new
    plane.take_off
    ap.planes << plane
    ap.take_off_from_runway(plane)
    expect(ap.planes).not_to include [subject]
  end

  it 'checks plane is flying' do
    subject.taken_off
    expect(subject.flying?).to eq true
  end

  it 'checks plane is at the airport' do
    expect(subject.at_airport?).to eq true
  end

end
