require 'plane'
require 'airport'

describe 'Feature Test' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new weather, 10 }
  let(:weather) { Weather.new}
  storm_seed = (1..100).find { |n| srand(n); rand(Weather::SUNNINESS) == 0 }
  sun_seed = storm_seed - 1

  it 'can land and take off multiple planes' do
    planes = []
    10.times { planes << Plane.new }
    planes.each { |plane| srand(sun_seed); airport.land! plane }
    expect(airport.contain? planes[0]).to eq true
    srand(sun_seed)
    expect{airport.land! plane}.to raise_error 'The airport is full!'
    srand(storm_seed)
    expect{airport.land! plane}.to raise_error 'Too stormy!'
    planes.each { |plane| srand(sun_seed); airport.take_off! plane}
    expect(airport.contain? planes[0]).to eq false
  end

end
