require 'Weather' # creating a Weather Class in the SRP (before, airport was responsible for weather)
describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'can be not stormy' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather.stormy?).to be false
    end
    
    it 'can be stormy' do
      allow(Kernel).to receive(:rand).and_return 10  
      expect(weather.stormy?).to be true
    end 
  end

end

