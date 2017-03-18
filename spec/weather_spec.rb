require './lib/weather.rb'

describe Weather do
  it 'Check sunny weather' do
    expect(subject.weather_is_sunny?).to eq(true).or eq(false)
  end
end
