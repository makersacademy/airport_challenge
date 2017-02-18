require 'weather'
require 'airport'

describe Weather do

  let(:airport) { Airport.new }
  it 'is stormy' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect(airport.stormy?).to be true
  end

  it 'is not stormy' do
    allow(airport).to receive(:stormy?).and_return(false)
    expect(airport.stormy?).to be false
  end

end
