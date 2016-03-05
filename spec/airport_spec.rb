require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane}
  let(:weather) { double :weather}

  before do
    allow(plane).to receive(:landed?)
    allow(plane).to receive(:landed).and_return(false)
    allow(weather).to receive(:stormy?).and_return(false)
  end

  it 'calls plane to land' do
    expect(plane).to receive(:landed?)
    airport.call_land(plane)
  end

  it 'fails to calls plane to land due to weather' do
    allow(weather).to receive(:stormy?).and_return(true)
    message = "Bad weather means plane can\'t land"
    expect {airport.call_land(plane)}.to raise_error message
  end

  it 'has plane once landed' do
    airport.call_land(plane)
    expect(airport.planes[0]).to be plane
  end

  it 'instructs planes to takeoff' do
    allow(plane).to receive(:landed).and_return(true)
    airport.call_land(plane)
    expect(airport.takeoff).to eq plane
  end

  it 'checks plane removed after takeoff' do
    airport.call_land(plane)
    allow(plane).to receive(:landed).and_return(true)
    airport.takeoff
    expect(airport.planes).to eq []
  end

  it 'raises error if airport full' do
    Airport::DEFAULTCAPACITY.times {airport.call_land(plane)}
    message = 'The airport is full'
    expect {airport.call_land(plane)}.to raise_error message
  end


end
