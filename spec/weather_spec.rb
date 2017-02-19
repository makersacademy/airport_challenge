require 'weather'
require 'airport'

describe Weather do

  let(:airport) { Airport.new }
  it 'is stormy' do
    allow(airport).to receive(:stormy?) {true}
    expect(airport.stormy?).to eq(true)
  end

  it 'is not stormy' do
    allow(airport).to receive(:stormy?) {false}
    expect(airport.stormy?).to eq(false)
  end

end
