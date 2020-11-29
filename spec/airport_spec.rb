require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'expects the hanger array in airport to change in response to calling airport.land(plane)' do
   expect{ airport.land(plane) }.to change{ airport.hanger }
  end

  it 'lands the plane' do
   allow(plane).to receive(:land)
   airport.land(plane)
   expect(airport.hanger).to include(plane)
  end

  it 'takes_off plane' do
   allow(plane).to receive(:take_off)
   airport.take_off(plane)
   expect(airport.hanger).not_to include(plane)
  end

  it 'will not land a plane if hanger is full' do
    allow(airport).to receive(:stormy?).and_return(false)
    expect { (Airport:: DEFAULT_CAPACITY + 1).times {airport.land(plane)} }.to raise_error('Hanger is full!')
  end

  it { is_expected.to respond_to(:hanger_report) }

  it 'will not take off in stormy weather' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect {airport.take_off(plane)}.to raise_error('Weather is stormy')
  end

end
