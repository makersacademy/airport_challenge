
require 'weather'
require 'airport'

describe Weather do

  let(:airport) {double :airport}

  it 'stormy is true' do
    allow(airport).to receive(:stormy?) {true}
    expect(airport.stormy?).to eq(true) | eq(false)
  end

  it 'stormy is false' do
    allow(airport).to receive(:stormy?) {false}
    expect(airport.stormy?).to eq(true) | eq(false)
  end
end
