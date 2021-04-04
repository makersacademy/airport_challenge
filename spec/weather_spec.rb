require 'weather'

describe Weather do

  describe '#stormy_weather?' do
    it 'tells us weather is stormy' do
      allow(subject).to receive(:storm_level).and_return(81)
      expect(subject.stormy_weather?).to eq(true)
    end
  end

  describe '#storm_level' do
    it 'generates a random number from 1 to 100' do
      expect(1..100).to include(subject.storm_level)
    end 
  end
end
