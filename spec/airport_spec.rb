require 'airport'
require 'weather'

RSpec.describe Airport do


  describe '#land and #takeoff' do
    it 'allows planes to land and takeoff' do
      Heathrow = Airport.new
      plane1 = Plane.new
      plane2 = Plane.new
      expect(Heathrow.land(plane1)).to eq [plane1]
      expect(Heathrow.land(plane2)).to eq [plane1, plane2]
      expect(Heathrow.take_off(plane1)). to eq plane1
      expect(Heathrow.take_off(plane2)). to eq plane2
      expect(subject.planes). to eq []
    end
  end




end
