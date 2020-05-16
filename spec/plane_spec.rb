require_relative '../lib/plane'
require_relative '../lib/airport'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#land' do
    it 'allows an ATC to instruct a pane to land at an airport' do
      expect(plane).to respond_to(:land)
      a = Airport.new
      plane.land(a)
      expect(a.planes.length).to eq(1)
    end
    it 'allows an ATC to prevent landing when airport is full' do
      a = Airport.new
      Airport::DEFAULT_CAPACITY.times { plane.land(a) }
      expect { plane.land(a) }
      .to raise_error('You cannot land - the airport is full.')
    end
  end

  describe '#take_off' do
    it 'allows an ATC to instruct a plane to take off' do
      a = Airport.new
      expect(plane.take_off(a)).to eq('air')
    end
    it 'plane confirms it is in the air' do
      a = Airport.new
      expect { plane.take_off(a) }
      .to output('Liftoff! We have a liftoff!').to_stdout
    end
  end
end
