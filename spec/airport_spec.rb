require 'airport'
require 'plane'

RSpec.describe Airport do

  describe '#land' do
    it 'tells the plane to land' do
      plane = Plane.new
      expect(plane.land).to eq(true)
    end
    it 'Returns true if plane_count is less than 5' do
      plane_land = Airport.new(plane_count: 3)
      expect(plane_land.land?).to eq(true)
    end

    it 'Returns false if plane_count is more than 5' do
      plane_land = Airport.new(plane_count: 7)
      expect(plane_land.land?).to eq(false)
    end
  end

end
