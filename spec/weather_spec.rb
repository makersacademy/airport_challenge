require 'weather'

describe Weather do 
  describe '.new' do 
    it 'initialises with a weather string' do 
      expect(subject.current).to be_a(String)
    end
    
    subject(:is_stormy) { described_class.new('stormy') }
    it 'accepts an initial state' do 
      5.times { expect(is_stormy.current).to eq('stormy') }
    end 
  end

  describe '.stormy?' do 
    subject(:is_stormy) { described_class.new('stormy') }
    it 'returns true when weather is stormy' do 
      expect(is_stormy.stormy?).to eq(true)
    end 
    
    subject(:is_grey) { described_class.new('grey') }
    it 'returns false when weather is not stormy' do 
      expect(is_grey.stormy?).to eq(false)
    end 
  end 
end 
