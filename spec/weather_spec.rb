require 'weather'

describe Weather do 
  describe '.new' do 
    it 'initialises with a weather Symbol' do 
      expect(subject.current).to be_a(Symbol)
    end
  end

  describe '.stormy?' do 
    it 'returns true when weather is stormy' do 
      allow(subject).to receive(:current).and_return(:stormy)
      expect(subject.stormy?).to eq(true)
    end 
    
    it 'returns false when weather is not stormy' do 
      allow(subject).to receive(:current).and_return(:grey)
      expect(subject.stormy?).to eq(false)
    end 
  end 
end 
