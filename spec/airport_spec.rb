require 'airport'

describe Airport do
subject(:airport) { described_class.new }
let(:plane) { double :plane}

  it 'calls plane to land' do
    allow(plane).to receive(:land)
    expect(plane).to receive(:land)
    airport.call_land(plane)
  end

  it 'has plane once landed' do
    allow(plane).to receive(:land)
    airport.call_land(plane)
    expect(airport.planes[0]).to be plane
  end

  it 'instructs planes to take off' do
    allow(plane).to receive(:land)
    airport.call_land(plane)
    expect(airport.takeoff).to eq plane
  end

end
