require 'airport'

RSpec.describe 'airport' do 
  it 'accepts plane and puts it in a terminal' do
    airport = Airport.new
    plane = 'BA30'
    expect(airport.land(plane)).to eq ['BA30']
  end
end

describe 'land' do 
  it 'tells plane to take off and confirms departure' do
    airport = Airport.new
    expect(airport.take_off).to eq true
  end
end

describe 'airport' do
  it 'expects plane not to land when its full' do
    airport = Airport.new
    expect(airport.full).to eq 20
  end
end

describe 'terminal' do
  it 'set to default capacity of 20' do
  airport = Airport.new
  subject = Airport::DEFAULT_CAPACITY
  expect(airport.full).to eq subject
  end
end

describe 'weather' do
  it 'does not allow takeoff when stormy' do
  weather = Weather.new
  subject = weather.departure?
  expect(subject).to eq false
  expect(weather.fly).to eq true
  end
end
