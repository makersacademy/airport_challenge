require_relative '../lib/weather'

describe Weather do

  let(:weather_condition) { double :weather_condition }

  it '#Return a weather condition' do
    allow(weather_condition).to receive(:weather) { "sunny" }
    expect(weather_condition.weather).to eq("sunny")  # Does not provide 100% coverage
  end

end
