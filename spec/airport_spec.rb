require 'airport'

RSpec.describe Airport do

   let(:gatwick) { gatwick = Airport.new }
   let(:plane) { plane = Plane.new }

  it 'Airport allows plane to land' do
    gatwick.weather=('sunny')
    expect(gatwick.land(plane)).to eq([plane])
  end

  it 'Landing the same plane twice not allowed' do
    gatwick.weather=('sunny')
    gatwick.land(plane)
    expect{ gatwick.land(plane) }.to raise_error 'Already landed'
  end

  it 'Airport allows plane to take off' do
    gatwick.weather=('sunny')
    expect(gatwick.take_off).to eq('Plane no longer in the airport')
  end

  it 'Airport prevents take off when weather is stormy' do
    gatwick.weather=('stormy')
    expect{ gatwick.take_off }.to raise_error('Take off not authorised')
  end

  it 'Airport prevents landing when weather is stormy' do
    gatwick.weather=('stormy')
    expect{ gatwick.land(plane) }.to raise_error('Landing not authorised')
  end

  it 'Airport prevents landing when is full' do
    gatwick.weather=('sunny')
    Airport::DEFAULT_CAPACITY.times do
       plane = Plane.new
       gatwick.land(plane)
     end
    expect{ gatwick.land(plane) }.to raise_error('Airport full')
  end

  it 'Has a default airport capacity that can be overridden' do
    expect(gatwick.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end
end
