require 'weather'

describe Stormy_Weather do

  it '#report - returns true if #generate_weather is lower than or matches STORM_PROBABILITY' do
    weather = Stormy_Weather.new
    weather.instance_variable_set("@random_weather", 0..2)
    expect(weather.report).to eq(true)
  end

end
