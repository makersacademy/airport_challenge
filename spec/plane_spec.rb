require 'plane.rb'

describe 'Plane' do
  describe '#land' do
    it 'allows a plane to land into an airport' do
      expect(Plane.new).to respond_to(:land)
    end
  end

  describe '#takeoff' do
    it 'allows a plane to takeoff from an airport' do
      expect(Plane.new).to respond_to(:takeoff)
    end
  end
end
