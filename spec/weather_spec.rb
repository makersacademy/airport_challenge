require_relative '../lib/weather'

context Weather do

  let(:weather_condition) { double :weather_condition }

  it '#Return a weather condition' do
    allow(weather_condition).to receive(:weather) { "stormy" }
    expect(weather_condition.weather).to eq("stormy")  # Does not provide 100% coverage
  end

end
