require 'plane'
require 'airport'



describe Airport do

  let(:airport) {Airport.new}
  let(:plane)   {Plane.new}
  let(:flying_plane) {double :plane, :landed=>false}
  let(:landed_plane) {double :plane, :landed=>true}


  it 'responds to #land method' do
    expect(subject).to respond_to :land
  end
  it 'responds to #take_off method' do
    expect(subject).to respond_to :take_off
  end
  it 'Prevent airplane to take off when weather is stormy' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect{airport.take_off(plane)}.to raise_error 'Take off not allowed due to stormy weather'
  end
  it 'Prevent airplane to landing when weather is stormy' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect{airport.land(plane)}.to raise_error 'Landing not allowed due to stormy weather'
  end

  it 'allows plane to take off if sunny' do
    allow(airport).to receive(:stormy?).and_return(false)
    allow(airport).to receive(:take_off?).and_return(true)
    expect(landed_plane.landed).to eq true
  end

  it 'prevents airplane to land if capacity is full' do
    allow(airport).to receive(:full?).and_return(true)
    expect{airport.land(plane)}.to raise_error 'Landing not allowed , airport full'
  end



end
