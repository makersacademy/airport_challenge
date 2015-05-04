require 'weather'

describe Weather do
  let(:airport) { double :airport }

  it 'can be stormy' do
    allow(airport).to receive(:stormy?) { true }
    expect(airport).to be_stormy
  end

  it 'cannot be sunny when it is stormy' do
    allow(airport).to receive(:stormy?) { false }
    allow(airport).to receive(:sunny?) { true }
    expect(airport.sunny?).to equal true
  end

  it 'is only stormy when num = 3' do
    allow(subject).to receive(:stormy?) { 3 }
    allow(airport).to receive(:stormy?) { true }
    expect(airport).to be_stormy
  end
end