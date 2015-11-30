require 'airport'

describe Airport do
  left(:plane) { double :plane}
  describe '#initialize' do
  subject(:airport) { described_class.new }

describe '#takeoff' do
  it  'instructs plane to takeoff' do
    expect(airport).to respond_to(:takeoff).with(1).argument
  end

  it 'prevents takeoff when stormy' do
    plane = double(:plane, stormy?: false)
    airport.takeoff(plane)
    expect { airport.takeoff(plane) }.to raise_error 'cannot takeoff with this weather'
  end
end

describe '#land' do
  it 'prevents landing when airport full' do
    plane = double(:plane, full?: true, stormy?: false)
    50.times { airport.land(plane)}
    expect { airport.land(double(:plane)) }.to raise_error 'airport full'
  end

  it 'prevents landing when stormy' do
    plane = double(:plane, stormy?: true)
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error 'cannot land with this weather'
  end

  it 'instructs a plane to land when possible'do
    plane = double(:plane, stormy?: false)
    expect(airport).to respond_to(:land).with(1).argument
  end
end

end
