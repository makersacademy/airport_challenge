require_relative '../lib/plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#land' do
    it 'allows an ATC to instruct a pane to land at an airport' do
      a = Airport.new
      plane.land(a)
      expect(a.planes.length).to eq(1)
    end
    it 'allows an ATC to prevent landing when airport is full' do
      expect { plane.land(Airport.new(0)) }
      .to raise_error('You cannot land - the airport is full.')
    end
  end

  describe '#take_off' do
    it 'allows an ATC to instruct a plane to take off' do
      a = Airport.new
      plane.land(a)
      plane.take_off(a)
      expect(a.planes.length).to eq(0)
    end
    it 'plane confirms it is in the air' do
      a = Airport.new
      plane.land(a)
      expect(plane.take_off(a)).to eq('Liftoff! We have a liftoff!')
    end
  end

  # Defending agaisnt edge cases
  it 'prevents an airborne plane from taking-off again' do
    a = Airport.new
    expect(plane.take_off(a)).to eq(nil)
  end

  it 'prevents a grounded plane from landing again' do
    a = Airport.new
    plane.land(a)
    expect(plane.land(a)).to eq(nil)
  end
end
