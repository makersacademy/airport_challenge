require 'airport'
require 'weather'

RSpec.describe Airport do


  describe '#land and #takeoff' do
    it 'allows planes to land and takeoff' do
      Heathrow = Airport.new
      plane1 = Plane.new
      plane2 = Plane.new
      expect(Heathrow.land(plane1)).to eq [plane1]
      expect {Heathrow.land(plane1).to raise_error('This plane has already landed')}
      expect(Heathrow.land(plane2)).to eq [plane1, plane2]
      expect(Heathrow.take_off(plane1)). to eq plane1
      expect(Heathrow.take_off(plane2)). to eq plane2
      expect(subject.planes). to eq []
    end
  end





    describe '#current_weather?' do
      it 'is either sunny or stormy' do
      Heathrow = Airport.new
      allow(Heathrow).to receive(:current_weather?) { "sunny" }
      expect(Heathrow.current_weather?).to eq "sunny"
      allow(Heathrow).to receive(:current_weather?) { "stormy" }
      expect(Heathrow.current_weather?).to eq "stormy"
      end

      it 'prevents #take_off when stormy' do
      end

    end

  end
