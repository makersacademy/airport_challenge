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
    expect { gatwick.land(plane, weather) }.to raise_error('Landing not authorised')
  end

end
