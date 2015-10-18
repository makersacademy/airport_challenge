require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  before do
    # standard weather condition
    allow(airport).to receive(:stormy?).and_return(false)
  end
  context 'when full' do
    it 'prevent planes from landing' do
      airport.clear_for_landing plane
      expect{ airport.clear_for_landing plane }.to raise_error 'Airport is full'
    end

  context 'when conditions are stormy' do
    before { allow(airport).to receive(:stormy?).and_return(true) }

    it 'prevent planes from landing' do
      expect { airport.clear_for_landing plane }.to raise_error 'Weather is stormy'
    end

    it 'prevent planes from taking off' do
      expect { airport.clear_for_landing plane }.to raise_error 'Weather is stormy'
    end
  end
  end
end
