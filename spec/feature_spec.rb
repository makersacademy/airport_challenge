require 'airport'
require 'plane'
require 'weather'

describe 'Feature spec - land/takeoff multiple planes' do
  it 'has the planes in the airport after landing' do
    ap1 = Airport.new
    p1 = Plane.new
    p2 = Plane.new
    srand 1 #forcing roll for good weather
    ap1.land(p1)
    srand 1
    ap1.land(p2)
    expect(ap1.planes).to eq [p1, p2]
  end

  it 'no longer has the planes in the airport after taking off' do
    ap1 = Airport.new
    p1 = Plane.new
    p2 = Plane.new
    srand 1; ap1.land(p1)
    srand 1; ap1.land(p2)
    srand 1; ap1.take_off(p1)
    srand 1; ap1.take_off(p2)
    expect(ap1.planes).to be_empty
  end

  it 'raises error when taking off from the wrong airport' do
    ap1 = Airport.new
    ap2 = Airport.new
    p1 = Plane.new
    p2 = Plane.new
    srand 1; ap1.land(p1)
    srand 1; ap2.land(p2)
    message = 'Plane not in the airport!'
    srand 1
    expect { ap1.take_off(p2) }.to raise_error(message)
  end

  it 'raises error if landing on stormy weather' do
    ap1 = Airport.new
    p1 = Plane.new
    srand 0 #forcing roll for stormy weather
    message = 'Cannot land on a storm! Try again!'
    expect { ap1.land(p1) }.to raise_error(message)
  end

  it 'raises error if taking off on stormy weather' do
    ap1 = Airport.new
    p1 = Plane.new
    srand 1; ap1.land(p1)
    srand 0
    message = 'Cannot take off on a storm! Try again!'
    expect { ap1.take_off(p1) }.to raise_error(message)
  end

  it 'initialize capacity, raises error if landing on full airport' do
    ap1 = Airport.new(2)
    p1 = Plane.new
    p2 = Plane.new
    p3 = Plane.new
    srand 1; ap1.land(p1)
    srand 1; ap1.land(p2)
    srand 1
    message = 'Cannot land on full airport!'
    expect { ap1.land(p3) }.to raise_error(message)
  end

  it 'raises error if plane already on land' do
    ap1 = Airport.new
    p1 = Plane.new
    srand 1; ap1.land(p1)
    srand 1
    message = 'Plane in land, cannot land again!'
    expect { ap1.land(p1) }.to raise_error(message)
  end
end
