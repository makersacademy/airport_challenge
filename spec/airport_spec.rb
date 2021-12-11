require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  # Test - Instruct plane to land at airport
  it 'instructs plane to land' do
    allow(airport).to receive(:stormy?).and_return false
    expect(airport).to respond_to(:land)
  end
  # Test - Instruct a plane to takeoff
  it 'instructs plane to takeoff' do
    expect(airport).to respond_to(:take_off)
  end
  # Test - Stop planes from landing when airport is full
  it 'does not allow plane to land if Airport is full' do
    allow(airport).to receive(:stormy?).and_return false
    20.times do
      airport.land(:plane)
    end
    expect { airport.land(:plane) }.to raise_error 'Airport is full'
  end
  # Test - do not allow planes to land when the weather is stormy
  it 'does not allow plane to land if stormy' do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(:plane) }.to raise_error 'Weather is storming can not land'
  end
end