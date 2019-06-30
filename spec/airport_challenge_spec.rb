require './lib/airport_challenge.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do

  it 'lands a plane' do
    plane = Plane.new
    airport = Airport.new
    expect(subject.land_plane(plane)).to eq [plane]
  end

  it 'allows plane to take off from airport' do
    plane = Plane.new
    airport = Airport.new
    subject.take_off(plane)
    expect(subject.take_off(plane)).to eq []
  end

  it 'prevents plane taking off if weather is stormy' do
    plane = Plane.new
    airport = Airport.new
    weather = Weather.new
    weather.stormy?
    expect(subject.take_off(weather)).to eq [plane]
  end

  it 'raises an error when weather is stormy for take off' do
    plane = Plane.new
    weather = Weather.new
    weather.stormy?
    expect { subject.prevent_take_off(weather) }.to raise_error "Plane cannot take off"
  end

  it 'raises an error when weather is stormy for landing' do
    plane = Plane.new
    weather = Weather.new
    weather.stormy?
    expect { subject.prevent_landing(weather) }.to raise_error "Plane cannot land"
  end

end
