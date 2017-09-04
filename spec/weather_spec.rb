require 'weather'
require 'airport'
require 'plane'

describe Weather do
  subject(:weather) { described_class.new }

  it { is_expected.to(respond_to(:stormy?)) }

end

# User stories made to test landing and take_off stormy weather
=begin
  it 'plane not allowed to land in stormy weather' do
    allow(airport).to receive(:stormy?).and_return(true)
    plane.land?
    expect { airport.land(plane) }.to raise_error(RuntimeError), 'Too stormy to land'
  end

  it 'plane not allowed to take off in stormy weather' do
    allow(airport).to receive(:stormy?).and_return(true)
    plane.take_off?
    expect { airport.take_off(plane) }.to raise_error(RuntimeError), 'Too stormy to take off'
  end
=end
