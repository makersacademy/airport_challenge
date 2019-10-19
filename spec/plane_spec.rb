require "plane"
require "airport"

describe Plane do

  describe 'flying?' do
    plane = Plane.new
    it 'When plane created it is flying' do
      expect(plane.flying?).to eq true
    end
  end

  describe 'land' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)

    it 'land the plane and check its not flying' do
      expect(plane.flying?).to eq false
    end

    it 'land the plane at an airport' do
      expect(plane.airport).to eq airport
    end

    it 'raise error when landing a plane that is not flying' do
      error_plane = Plane.new
      expect{plane.land(airport)}.to raise_error(RuntimeError,"Plane not flying")
    end
   end
end
