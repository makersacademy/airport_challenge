require 'airport'

RSpec.describe Airport do

  let(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  it 'will accept a landing plane in sunny weather' do
    allow(weather).to receive(:stormy?).and_return(false)
    expect(airport.accept_landing_plane(plane, weather)).to eq [plane]
  end

  it 'will prevent a plane from landing in stormy weather' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect(airport.accept_landing_plane(plane, weather)).to eq []
  end

  it 'will allow a plane to takeoff in sunny weather and confirm it has departed' do
    allow(weather).to receive(:stormy?).and_return(false)
    expect(airport.takeoff(plane, weather)).to eq []
  end

  it 'will prevent takeoff when weather is stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect(airport.takeoff(plane, weather)).to eq [plane]
  end

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'can have the default capacity overidden' do
    airport1 = Airport.new(250)
    expect(airport1.capacity).to eq 250
  end

  it 'will prevent landing if airport is at capacity' do
    allow(weather).to receive(:stormy?).and_return(false)
      airport.capacity.times do
        airport.accept_landing_plane(plane, weather)
      end
      expect { airport.accept_landing_plane(plane, weather) }.to raise_error 'Airport is full'
  end


end
