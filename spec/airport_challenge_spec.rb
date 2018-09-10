require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  it 'instructs plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end
  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:takeoff)
  end

  it 'cannot take off when stormy' do
    allow(airport).to receive(:stormywether?).and_return true
    #expect { airport.takeoff(plane) }.to raise_error "Can't take off: the weather is stormy"
  end

  it 'cannot land when stormy' do
    allow(airport).to receive(:stormywether?).and_return true
    #expect { airport.land(plane) }.to raise_error "Can't land: the weather is stormy"
  end
end
