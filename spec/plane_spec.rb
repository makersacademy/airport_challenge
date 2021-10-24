require './lib/airport'
require './lib/plane'
require './lib/weather_report'

describe Plane do
  airport = Airport.new
  plane = Plane.new

  before do
    allow(airport).to receive(:stormy?).and_return(false)
  end

  it 'flying state initialises as true' do
    allow(subject).to receive(:flying?).and_return(true)
  end

  it 'flying state changes to false when landed' do
    airport.land(subject)
    expect(subject.flying?).to eq false
  end

  it 'flying state changes to true when taking off' do
    airport.take_off(subject)
    expect(subject.flying?).to eq true
  end

=begin
  it 'cannot land if already landed' do
    plane.landed?(true)
    expect { airport.land(plane) }.to raise_error 'Plane already landed'
  end

  it 'cannot take off if already airborne' do
    expect { airport.take_off(subject) }.to raise_error 'Plane already airborne'
  end
=end
end
