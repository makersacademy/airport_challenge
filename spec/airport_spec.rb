require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do

let(:air) { Airport.new }
let(:aero) { Plane.new }

  it 'can land respond to landing a plane at the airport' do
    expect(air).to respond_to(:land)
  end

  it 'can land a plane' do
    expect(air.land(aero, 2).length).to eq(1)
  end

  it 'can instruct a plane to take off and confirm it has left' do
    air.land(aero, 2)
    expect(air.take_off(2)).to eq(aero)

  end

  it 'can report the weather' do
    expect(Weather.new).to respond_to(:weather_generator)
  end

  it 'can report weather as stormy' do
    weather = Weather.new
    allow(weather).to receive(:weather_generator).and_return(1)
    expect(weather.weather_generator).to eq(1)
  end

  it 'can prevent landing if weather is stormy' do
    expect {air.land(aero, 1)}.to raise_error(RuntimeError)
  end

  it 'can prevent take off if weather is stormy' do
    expect {air.take_off(1)}.to raise_error(RuntimeError)
  end

  it 'prevents landing if airport is full' do
    50.times { air.land(aero, 2) }
    expect {air.land(aero, 2)}.to raise_error(RuntimeError)
  end

end
