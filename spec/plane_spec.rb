require 'plane'

describe Plane do

  describe '#land' do
    it 'lands a plane at the specified airport if sunny' do
      plane = Plane.new
      heathrow = Airport.new("Heathrow")
      allow(heathrow).to receive(:skies_clear).and_return("sunny")
      plane.land(heathrow)
      expect(plane).to have_attributes(:location => "Heathrow")
    end
    it 'does not allow a landing if stormy' do
      plane = Plane.new
      heathrow = Airport.new("Heathrow")
      allow(heathrow).to receive(:skies_clear).and_return("stormy")
      expect { plane.land(heathrow) }.to raise_error "Approach unsafe"
    end
    it 'tells the pilot to take off before landing' do
      plane = Plane.new
      heathrow = Airport.new("Heathrow")
      allow(heathrow).to receive(:skies_clear).and_return("sunny")
      plane.land(heathrow)
      expect { plane.land(heathrow) }.to raise_error "You must be airborne to land"
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off from an airport if sunny' do
      plane = Plane.new
      heathrow = Airport.new("Heathrow")
      allow(heathrow).to receive(:skies_clear).and_return("sunny")
      plane.take_off(heathrow)
      expect(plane).to have_attributes(:location => "Flying")
    end
    it 'does not allow a take off if stormy' do
      plane = Plane.new
      heathrow = Airport.new("Heathrow")
      allow(heathrow).to receive(:skies_clear).and_return("stormy")
      expect { plane.take_off(heathrow) }.to raise_error "Approach unsafe"
    end
  end
end
