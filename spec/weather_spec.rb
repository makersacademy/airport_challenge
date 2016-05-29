require 'weather'

describe Weather do

  describe 'responds to:' do
    it 'responds to stormy?' do
      expect(subject).to respond_to :stormy?
    end
  end

  describe '#stormy?' do
    # can be overridden
    num1 = 6
    rand_stormy_weather = rand(num1..10)
    it "between #{num1} and 10 is stormy: '#{rand_stormy_weather}'" do
      expect(subject.stormy?(rand_stormy_weather)).to eq true
    end

    # can be overridden
    num2 = 5
    rand_good_weather = rand(1..num2)
    it "between 1 and #{num2} is NOT stormy: '#{rand_good_weather}''" do
      expect(subject.stormy?(rand_good_weather)).to eq false
    end
  end
end
