require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to be_a(Airport) }

  describe '#land' do
    it 'lands a plane at the airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq(airport.hangar)
    end

    it 'raises an error and prevents plane landing when the airport is full' do
      airport = Airport.new
      10.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error("Airport is full")
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off and is no longer at the airport' do
      airport = Airport.new
      plane = Plane.new
      airport.take_off(plane)
      expect(airport.hangar).to eq([])
    end
  end
end
