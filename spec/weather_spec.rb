require 'weather'

RSpec.describe Weather do
  subject(:weather) { described_class.new }
  it 'should be sunny or stormy' do
    expect([:sunny, :stormy]).to include(weather.forecast)
  end
  it 'should check that all weather variants are possible' do
    multi_day_forecast = []
    1_000.times { multi_day_forecast << weather.forecast }
    expect(multi_day_forecast.uniq.sort).to eq [:stormy, :sunny]
  end
end
