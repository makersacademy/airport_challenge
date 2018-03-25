require 'weather'

describe Weather do
  include Weather
  describe 'stormy?' do
    it 'should return true when random number equals 1' do
      allow(Kernel).to receive(:rand).with(10).and_return(1)
      expect(stormy?).to eq true
    end
  
    it 'should return false when random number does not equal 1' do
      allow(Kernel).to receive(:rand).with(10).and_return(5)
      expect(stormy?).to eq false
    end
  end
end
