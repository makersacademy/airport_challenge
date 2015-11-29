require 'airport'
require 'weather'

describe 'Feature tests' do
  context 'Weather is clear' do
    it 'allows a number of planes to land and take off' do
      allow(Weather).to receive(:stormy?).and_return(false)
      heathrow = Airport.new
      easyjet = Plane.new
      virgin = Plane.new
      british_airways = Plane.new
      ryan_air = Plane.new
      heathrow.land(easyjet)
      heathrow.land(virgin)
      heathrow.land(british_airways)
      heathrow.take_off(easyjet)
      heathrow.land(ryan_air)
      heathrow.take_off(virgin)
      heathrow.take_off(british_airways)
      expect(heathrow.landed_planes).to eq [ryan_air]
    end

    it 'planes know which airport they are at' do
      allow(Weather).to receive(:stormy?).and_return(false)
      heathrow = Airport.new
      gatwick = Airport.new
      easyjet = Plane.new
      virgin = Plane.new
      british_airways = Plane.new
      ryan_air = Plane.new
      heathrow.land(easyjet)
      heathrow.land(virgin)
      gatwick.land(british_airways)
      gatwick.land(ryan_air)
      expect(british_airways.airport_at).to eq gatwick
    end

    it 'has a capacity which can be changed and won\'t breach it' do
      allow(Weather).to receive(:stormy?).and_return(false)
      heathrow = Airport.new
      heathrow.update_capacity(5)
      easyjet = Plane.new
      virgin = Plane.new
      british_airways = Plane.new
      ryan_air = Plane.new
      icelandic_air = Plane.new
      monarch = Plane.new
      heathrow.land(easyjet)
      heathrow.land(virgin)
      heathrow.land(british_airways)
      heathrow.land(ryan_air)
      heathrow.land(icelandic_air)
      message = "Can't land, the airport is full"
      expect{heathrow.land(monarch)}.to raise_error message
    end

  end

  context 'Weather is stormy' do
    it 'prevents planes from taking off if the weather becomes stormy' do
      allow(Weather).to receive(:stormy?).and_return(false)
      heathrow = Airport.new
      easyjet = Plane.new
      virgin = Plane.new
      british_airways = Plane.new
      ryan_air = Plane.new
      heathrow.land(easyjet)
      heathrow.land(virgin)
      heathrow.land(british_airways)
      heathrow.take_off(easyjet)
      heathrow.land(ryan_air)
      heathrow.take_off(virgin)
      allow(Weather).to receive(:stormy?).and_return(true)
      message = "Can't take off in storm"
      expect{heathrow.take_off(british_airways)}.to raise_error message
    end

    it 'prevents planes from landing if the weather becomes stormy' do
      allow(Weather).to receive(:stormy?).and_return(false)
      heathrow = Airport.new
      easyjet = Plane.new
      virgin = Plane.new
      british_airways = Plane.new
      ryan_air = Plane.new
      heathrow.land(easyjet)
      heathrow.land(virgin)
      heathrow.land(british_airways)
      heathrow.take_off(easyjet)
      allow(Weather).to receive(:stormy?).and_return(true)
      message = "Can't land in storm"
      expect{heathrow.land(ryan_air)}.to raise_error message

    end
  end
end
