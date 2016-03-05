require 'weather'

describe Weather  do

  describe 'current weather access:' do

    it 'can show the current weather' do
      expect(subject).to respond_to(:current_weather)
    end

  end

  describe 'weather changing:' do

    it 'can change the weather' do
      expect(subject).to respond_to(:change_weather).with(0).arguments
    end

    it 'can change the weather to a given value' do
      subject.change_weather(:dummy_weather)
      expect(subject.current_weather).to eq(:dummy_weather)
    end

  end

end
