require 'weather'

describe Weather do 

  describe 'storm' do
    
    it 'should return a number between 1 and 4' do 
      expect(subject.storm_maker).to be <5
    end

    it 'should return storm if storm_maker == 1' do
      allow(subject).to receive(:storm_maker).and_return(1)
      expect(subject.storm?).to eq true
    end

    it 'should return sunny if storm_maker > 1' do
      allow(subject).to receive(:storm_maker).and_return(2,3,4)
      expect(subject.storm?).to eq false
    end

  end



end




