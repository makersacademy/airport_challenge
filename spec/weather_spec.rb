require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Weather do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  it 'will not let a plane land if stormy' do
    # allow(airport).to receive(:stormy?) {true}
    subject.stub(:stormy?).and_return(true)
    plane.landed
    expect {airport.land(plane)}.to raise_error 'Weather is stormy'
  end

  it 'will not let a plane take off if stormy' do
    plane.landed
    # allow(airport).to receive(:stormy?) {true}
    subject.stub(:stormy?).and_return(true)
    expect {airport.take_off(plane)}.to raise_error 'Weather is stormy'
  end
end