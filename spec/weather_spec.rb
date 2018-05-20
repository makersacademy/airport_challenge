require "weather"

describe Weather do

  let(:weather_station) { described_class.new }

  it "#report s the weather as either sunny or stormy." do
    expect(weather_station.report).
      to eq(:sunny).or eq(:stormy)
  end

end
