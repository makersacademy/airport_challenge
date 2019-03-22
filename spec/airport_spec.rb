require 'plane'
require 'airport'

describe Airport do

  it 'accepts planes instructed to land at airport' do
    p = Plane.new
    p.land
    subject.land_on_runway(p)
    expect(subject.planes.map { |plane| plane.landing?}).to eq [true]
  end

  it 'checks plane is gone after take off' do
    plane = Plane.new
    plane.take_off
    subject.planes << plane
    subject.take_off_from_runway(plane)
    expect(subject.planes).not_to include [plane]
  end

  it 'has a capacity' do
    ap = Airport.new(30)
    ap.capacity.times {ap.land_on_runway(Plane.new)}
    expect{ ap.land_on_runway(Plane.new) }.to raise_error ("Airport at capacity")
  end

  it 'has a default capacity if left blank' do
    ap = Airport.new
    expect(ap.capacity).to eq 20
  end

end
