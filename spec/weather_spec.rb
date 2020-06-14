require './lib/weather.rb'

describe Weather do
  describe '#stormy?' do

    it 'should return either true or false' do
      expect(subject.stormy?).to be(true).or be(false)
    end

    it 'should return true if I tell it to' do
      allow(subject).to receive(:stormy?) { true }
      expect(subject.stormy?).to eq(true)
    end 

    it 'should return false if I tell it to' do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.stormy?).to eq(false)
    end
    
  end

end
