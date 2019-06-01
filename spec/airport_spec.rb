require 'airport'
require 'plane'

describe Airport do
  describe '.land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
  end
end
