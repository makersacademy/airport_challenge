require 'airport'

RSpec.describe Airport do

  it 'Airport allows plane to land' do
    weather = Weather.new
    gatwick = Airport.new
    plane = Plane.new
    expect(gatwick.land(plane, weather='sunny')).to eq([plane])
  end

  it 'Airport allows plane to take off' do
    weather = Weather.new
    gatwick = Airport.new
    plane = Plane.new
    expect(gatwick.take_off(weather='sunny')).to eq('Plane no longer in the airport')
  end

  it 'Airport prevents take off when weather is stormy' do
    weather = Weather.new
    gatwick = Airport.new
    expect{ gatwick.take_off(weather) }.to raise_error('Take off not authorised')
  end

  it 'Airport prevents landing when weather is stormy' do
    weather = Weather.new
    gatwick = Airport.new
    plane = Plane.new
    expect{ gatwick.land(plane, weather) }.to raise_error('Landing not authorised')
  end

  it 'Airport prevents landing when is full' do
    weather = Weather.new
    plane = Plane.new
    gatwick = Airport.new
    Airport::DEFAULT_CAPACITY.times { gatwick.land(plane,weather="sunny") }
    expect{ gatwick.land(plane,weather="sunny") }.to raise_error('Airport full')
  end

  it 'Has a default airport capacity that can be overridden' do
    gatwick = Airport.new
    expect(gatwick.capacity).to eq Airport::DEFAULT_CAPACITY
  end


end
