require './lib/weather.rb'

describe Weather do
  describe 'stormy?' do
    it 'should return true when random number is 4' do
      allow(subject).to receive(:rand) { 4 }
      expect(subject.stormy?).to eq true
    end

    it 'should return true when random number is 8' do
      allow(subject).to receive(:rand) { 8 }
      expect(subject.stormy?).to eq true
    end

    it 'should return false when random number is not 4 or 8' do
      allow(subject).to receive(:rand) { 5 }
      expect(subject.stormy?).to eq false
    end
  end
end
