require 'airport'
require 'weather'

describe 'Feature tests' do


  let(:weather) {double(:weather)}
  let(:heathrow) {Airport.new}
  let(:gatwick) {Airport.new}
  let(:easyjet) {Plane.new}
  let(:virgin) {Plane.new}
  let(:british_airways) {Plane.new}
  let(:ryan_air) {Plane.new}
  let(:icelandic_air) {Plane.new}
  let(:monarch) {Plane.new}
  before{allow(Weather).to receive(:stormy?).and_return(false)}

  context 'Weather is clear' do
    it 'allows a number of planes to land and take off' do
      easyjet.land(heathrow)
      virgin.land(heathrow)
      british_airways.land(heathrow)
      heathrow.take_off(easyjet)
      ryan_air.land(heathrow)
      heathrow.take_off(virgin)
      heathrow.take_off(british_airways)
      expect(heathrow.landed_planes).to eq [ryan_air]
    end

    it 'planes know which airport they are at' do
      easyjet.land(heathrow)
      virgin.land(heathrow)
      british_airways.land(gatwick)
      ryan_air.land(gatwick)
      expect(british_airways.airport_at).to eq gatwick
    end

    it 'has a capacity which can be changed and won\'t breach it' do
      heathrow.update_capacity(5)
      easyjet.land(heathrow)
      virgin.land(heathrow)
      british_airways.land(heathrow)
      ryan_air.land(heathrow)
      icelandic_air.land(heathrow)
      message = "Can't land, the airport is full"
      expect{monarch.land(heathrow)}.to raise_error message
    end

  end

  context 'Weather is stormy' do
    it 'prevents planes from taking off if the weather becomes stormy' do
      easyjet.land(heathrow)
      virgin.land(heathrow)
      british_airways.land(heathrow)
      heathrow.take_off(easyjet)
      ryan_air.land(heathrow)
      heathrow.take_off(virgin)
      allow(Weather).to receive(:stormy?).and_return(true)
      message = "Can't take off in storm"
      expect{heathrow.take_off(british_airways)}.to raise_error message
    end

    it 'prevents planes from landing if the weather becomes stormy' do
      easyjet.land(heathrow)
      virgin.land(heathrow)
      british_airways.land(heathrow)
      allow(Weather).to receive(:stormy?).and_return(true)
      message = "Not clear to land"
      expect{ryan_air.land(heathrow)}.to raise_error message

    end
  end
end
