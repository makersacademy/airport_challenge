require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Weather do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}
  let(:weather_above_70) {rand(71..100)}
  let(:weather_below_70) {rand(0..70)}

  describe 'storm probability' do
    it 'will be stormy if rand(100)>70' do
      weather_above_70
      allow(airport).to receive(:stormy?) {true}
    end

    it 'will be sunny if rand(100)<=70' do
      weather_below_70
      allow(airport).to receive(:stormy?) {false}
    end
  end

  it 'will not let a plane land if stormy' do
    allow(airport).to receive(:stormy?) {true}
    plane.landed
    expect {airport.land(plane)}.to raise_error 'Weather is stormy'
  end

  it 'will not let a plane take off if stormy' do
    plane.landed
    allow(airport).to receive(:stormy?) {true}
    expect {airport.take_off(plane)}.to raise_error 'Weather is stormy'
  end
end