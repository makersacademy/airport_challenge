
require 'weather.rb'

describe Weather do
  describe "#weather_forecast" do
    subject { Weather.new }
    it { is_expected.to respond_to :weather_forecast }

    it 'returns a sample of the weather forecast' do
      allow(subject).to receive(:sample).and_return(:weather_forecast)
    end
  end
end
