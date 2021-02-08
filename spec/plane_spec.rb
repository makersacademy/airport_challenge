require 'airports'
require 'planes'

describe Plane do
  describe '#plane_landing' do
    it 'responds to the method plane_landing' do
      airport = Airport.new
      plane = Plane.new
      expect(plane).to respond_to(:land)
    end
  end
  describe '#plane_takeoff' do
    it 'responds to the method take_off' do
      airport = Airport.new
      plane = Plane.new
      expect(plane).to respond_to(:take_off)
    end
  end
end
