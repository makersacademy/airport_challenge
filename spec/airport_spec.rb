require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe 'land' do
    it 'allows a plane to land at an airport' do
      expect(airport.land(plane)).to eq([plane])
    end

    it 'prevents landing when the airport is full' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error 'Airport full'
    end
  end

  describe 'takeoff' do
    it 'removes a plane from the airport' do
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq(plane)
      expect(airport.hangar).to eq([])
    end
  end
end
