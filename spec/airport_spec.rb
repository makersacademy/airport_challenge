require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather: weather) }
  let(:plane) { double(:plane, takeoff: true, land: false) }
  let(:weather) { double(:weather, stormy?: false) }

  describe '#initialize' do
    it 'has a variable capacity' do
      airport = described_class.new(capacity: 20)
      expect(airport.capacity).to eq 20
    end
  end

describe '#takeoff' do
  it  'instructs plane to takeoff' do
    airport.land plane
    airport.takeoff plane
    expect(airport.planes).to eq []
  end

  it 'prevents takeoff when stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect { airport.takeoff(plane) }.to raise_error 'cannot takeoff with this weather'
  end
end

describe '#land' do
  it 'instructs a plane to land' do
    airport.land plane
    expect(airport.planes).to include plane
  end

  it 'prevents landing when airport full' do
    50.times { airport.land(plane)}
    expect { airport.land(double(:plane)) }.to raise_error 'airport full'
  end

  it 'prevents landing when stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect { airport.land(plane) }.to raise_error 'cannot land with this weather'
  end
end

end
