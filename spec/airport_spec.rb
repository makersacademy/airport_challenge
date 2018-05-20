require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }

  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
  #
  # it 'prevents plane from taking off when stormy' do
  #   allow(airport).to receive(:stormy?).and_return true
  #   expect { airport.take_off(plane) }.to raise_error 'Cannot take off: stormy weather'
  # end
  #
  # it 'prevents plane from landing when stormy' do
  #   allow(airport).to receive(:stormy?).and_return true
  #   expect { airport.land(plane) }.to raise_error 'Cannot land: stormy weather'
  # end

  it 'does not allow landing when airport is full' do
    plane = double :plane
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Cannot land: airport full'
  end

end
