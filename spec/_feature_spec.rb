require 'plane'
require 'airport'

describe 'Feature Test' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new weather, 10 }
  let(:weather) { Weather.new}

  it 'can land and take off multiple planes' do
    planes = []
    10.times { planes << Plane.new }
    allow(weather).to receive(:rand) { 1 }
    planes.each { |plane| airport.land! plane }
    expect(airport.contain? planes[0]).to eq true
    expect{airport.land! plane}.to raise_error 'The airport is full!'
    allow(weather).to receive(:rand) { 0 }
    expect{airport.land! plane}.to raise_error 'Too stormy!'
    allow(weather).to receive(:rand) { 1 }
    planes.each { |plane| airport.take_off! plane}
    expect(airport.contain? planes[0]).to eq false
  end

end
