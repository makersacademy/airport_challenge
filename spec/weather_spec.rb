require 'weather'

describe Weather do

  before (:each) do
    @weather = Weather.new
  end

  it 'random weather method exists' do

    expect(@weather).to respond_to(:random_weather)
  end

  it 'randomises weather' do

    weather_results = []

    1000.times { weather_results << @weather.random_weather }

    expect(weather_results.include?(:stormy)).to eq(true)
  end

  it 'can force stormy weather' do

    expect(@weather.random_weather(true)).to eq (:stormy)
  end
end
