require "plane"
require "airport"

describe Plane do
  subject(:a_plane) { Plane.new }
  subject(:an_airport) { Airport.new }

  describe 'flying?' do

    it 'When plane created it is flying' do
      expect(a_plane.flying?).to eq true
    end
  end

  describe 'land' do

    it 'land the plane and check its not flying' do
      a_plane.land(an_airport)
      expect(a_plane.flying?).to eq false
      expect(a_plane.airport).to eq an_airport
    end

    it 'raise error when landing a plane that is not flying' do
      a_plane.land(an_airport)
      expect { a_plane.land(an_airport) }.to raise_error(RuntimeError, "Plane not flying")
    end
  end

  describe 'takeoff' do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
  end
end
