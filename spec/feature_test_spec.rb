require 'airport'
require 'weather'

describe 'FEATURE TESTS' do

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

end
