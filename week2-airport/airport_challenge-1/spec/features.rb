require 'airport'
require 'airplane'

describe 'features' do
  let(:airport) { Airport.new(10)}
  let(:plane) { Airplane.new }
context 'when not stormy' do
  before do  
    allow(airport).to receive(:stormy?).and_return false
  end

  it 'so airplane can land, tell airplane to land' do
    expect { airport.land(airplane)}.not_to raise_error
  end
  
  it 'so airplane can take off, tell airplane to take off' do
    expect { airport.take_off(airplane) }.not_to raise_error
  end
  
  context 'when airport is at capacity' do
    it 'does not allow airplanes to land' do
      10.times do
        airport.land(airplane)
      end
        expect { airport.land(airplane) }.to raise_error 'Cannot land: Airport at capacity'
  end

  context 'when weather is stormy' do
    before do 
      allow(airport).to receive(:stormy?).and_return true
    end
    
    it 'does not allow planes to land' do
      expect { airport.land(airplane) }.to raise_error 'Cannot land: weather is stormy'
    end

    it 'does not allow planes to take off' do
      expect { airport.take_off(airplane) }.to raise_error 'Cannot take off: weather is stormy'
    end
  end
end