require 'weather'

describe Weather do

  describe 'forcast' do
    it { is_expected.to respond_to :weather_forecast }
    it 'should know when the weather is stormy' do
      subject.weather_forecast = 'Stormy'
      expect(subject.weather_forecast).to eq 'Stormy'
    end
  end
end
