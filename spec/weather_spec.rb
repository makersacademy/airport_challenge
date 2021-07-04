require 'weather'

describe Weather do

  describe "#rand_num" do
    it 'generates a random number' do
      expect(subject.rand_num).to be_between(1,4)
    end
  end 

  describe '#weather_conditions' do
    it 'gives a weather forecast at random' do
      allow(subject).to receive(:rand_num) { 4 }
      expect(subject.weather_conditions).to eq('stormy')
    end
  end

end
