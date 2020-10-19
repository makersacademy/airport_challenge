
require 'plane'

RSpec.describe Plane do

  describe '#land?' do
    it 'Returns true if plane_count is less than 5' do
      plane_land = Plane.new(plane_count: 3)
      expect(plane_land.land?).to eq(true)
    end

    it 'Returns false if plane_count is more than 5' do
      plane_land = Plane.new(plane_count: 7)
      expect(plane_land.land?).to eq(false)
    end
  end

end
