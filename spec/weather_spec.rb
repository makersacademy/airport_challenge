require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy' do
    it 'cannot be stormy' do
      allow(weather).to receive(:rand).and_return 1
      weather.stormy?
      expect(weather.stormy?).to be false
    end 
    
    it 'can be stormy' do
      allow(weather).to receive(:rand).and_return 6
      weather.stormy?
      expect(weather.stormy?).to be true
      end 
  end

end