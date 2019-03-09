require 'plane'

describe Plane do

  describe '#land' do
    it 'lands a plane at the specified airport' do
      plane = Plane.new
      heathrow = Airport.new("Heathrow")
      plane.take_off
      plane.land(heathrow)
      expect(plane).to have_attributes(:location => "Heathrow")
    end

    it 'tells the pilot to take off before landing' do
      plane = Plane.new
      heathrow = Airport.new("Heathrow")
      expect { plane.land(heathrow) }.to raise_error "You must be airborne to land"
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off from an airport' do
      plane = Plane.new
      plane.take_off
      expect(plane).to have_attributes(:location => "Flying")

    end
  end
end
