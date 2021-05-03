require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy' do
    it 'is not stormy' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather.stormy?).to eq(false)
    end 
    
    it 'is stormy' do
      allow(Kernel).to receive(:rand).and_return 10
      p weather.stormy?
      expect(weather.stormy?).to eq(true)
    end 
  end 
end
