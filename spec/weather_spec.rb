# This is a weather class rspec that tests random weather pattern
require 'weather'

describe Weather do

  describe '#Forcasts' do

    it 'returns stormy true' do
      allow(subject).to receive(:rand).and_return(6)
      expect(subject.forcast).to eq true
    end

    it 'returns excelent_weather false' do
      allow(subject).to receive(:rand).and_return(0)
      expect(subject.forcast).to eq false
    end

    it 'returns good_weather false' do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.forcast).to eq false
    end

    it 'returns acceptable_weather false' do
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.forcast).to eq false
    end

    it 'returns rainy false' do
      allow(subject).to receive(:rand).and_return(3)
      expect(subject.forcast).to eq false
    end

    it 'returns overcast false' do
      allow(subject).to receive(:rand).and_return(4)
      expect(subject.forcast).to eq false
    end

  end
end
