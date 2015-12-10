require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane)       { double(:plane) }

  it 'intructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'does not allow planes to land when airport is full' do
    airport.capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error"Sorry mate- the airport is full"
  end
end
