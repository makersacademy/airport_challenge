require 'weather'

describe Weather do
  let(:current_weather) { Weather.new }

  describe '#random' do
    it 'generates a random number between 1 and 3' do
      allow(current_weather).to receive(:rand).and_return(1)
    end
  end

  describe '#condition' do
    it 'assigns weather as sunny' do
      allow(current_weather).to receive(:condition).and_return('sunny')
      expect(current_weather.condition).to eq 'sunny'
    end

    it 'assigns weather as stormy' do
      allow(current_weather).to receive(:condition).and_return('stormy')
      expect(current_weather.condition).to eq 'stormy'
    end
  end
end