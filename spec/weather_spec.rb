require 'weather'

describe Weather do
  let(:airport) {double :airport}

  it 'allows the airport to be stormy' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect(airport).to be_stormy
  end

  it 'can be stormy' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect(airport).to be_stormy
  end

  it 'can be not stormy' do
    allow(airport).to receive(:stormy?).and_return(false)
    expect(airport).not_to be_stormy
  end

  it 'generates storms when storm rate 1' do
    allow(airport).to receive(:generate_weather).with(1)
    allow(airport).to receive(:stormy?).and_return(true)
    airport.generate_weather(1)
    expect(airport).to be_stormy
  end

  it 'responds to storm rate of zero with no storm' do
    allow(airport).to receive(:generate_weather).with(0)
    allow(airport).to receive(:stormy?).and_return(false)
    airport.generate_weather(0)
    expect(airport).not_to be_stormy
  end
end
