require 'plane'

describe Plane do
    it 'lands at airport' do
      plane = Plane.new
      expect(plane).to respond_to(:land)
    end
end
