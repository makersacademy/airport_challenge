require 'plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#landing' do
    it 'lands a plane' do
      plane.land
      expect(plane.landed).to be true
    end
  end

  describe '#taking off' do
    it 'lets a plane takeoff' do
      plane.takeoff
      expect(plane.landed).to be false
    end
  end

end
