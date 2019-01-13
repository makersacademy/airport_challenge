require 'airport'

RSpec.describe Airport do

  it 'Airport allows plane to land' do
    gatwick = Airport.new
    gatwick.weather=('sunny')
    plane = Plane.new
    expect(gatwick.land(plane)).to eq([plane])
  end

  it 'Airport allows plane to take off' do
    gatwick = Airport.new
    gatwick.weather=('sunny')
    expect(gatwick.take_off).to eq('Plane no longer in the airport')
  end

  it 'Airport prevents take off when weather is stormy' do
    gatwick = Airport.new
    gatwick.weather=('stormy')
    expect{ gatwick.take_off }.to raise_error('Take off not authorised')
  end

  it 'Airport prevents landing when weather is stormy' do
    gatwick = Airport.new
    gatwick.weather=('stormy')
    plane = Plane.new
    expect{ gatwick.land(plane) }.to raise_error('Landing not authorised')
  end

  it 'Airport prevents landing when is full' do
    gatwick = Airport.new
    gatwick.weather=('sunny')
    plane = Plane.new
    Airport::DEFAULT_CAPACITY.times { gatwick.land(plane) }
    expect{ gatwick.land(plane) }.to raise_error('Airport full')
  end

  it 'Has a default airport capacity that can be overridden' do
    gatwick = Airport.new
    expect(gatwick.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end


end
