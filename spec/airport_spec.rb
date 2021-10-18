require './lib/airport'

  describe Airport do
  subject(:airport) { described_class.new(15) }
    
  context 'when not stormy' do
        
  before do
    allow(airport).to receive(:stormy?).and_return false
  end
  
  it 'lands plane' do
    expect { (airport).to respond.to(:land).with(1).argument }
  end

  it 'allows planes to take off' do
    expect { (airport).to respond.to(:take_off).with(1).argument }
  end 

  it 'do not allow planes to land when airport is full' do
    15.times do
    airport.land(:plane)
    end
    expect { airport.land(:plane) }.to raise_error 'no landing space! airport full'
  end
  end
    
  context 'when stormy' do
    it 'raises error if asked to land plane and weather is stormy' do
      allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(:plane) }.to raise_error 'cannot land plane if weather stormy'
  end

    it 'raises error if plane asked to take off when weather stormy' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(:plane) }.to raise_error 'cannot take off if weather stormy'
      end
    end
end
