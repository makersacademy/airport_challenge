require 'weather'

describe Weather do

  it { is_expected.to be_instance_of(Weather) }

  it 'returns stormy weather approximately one day in every 10' do
    storeweather = []
    10000.times do
      storeweather << subject.weather
    end
    sunny = storeweather.count(sunny)
    stormy = storeweather.count(stormy)
    p percentage = stormy / sunny
    expect(percentage).to be_within(0.1).of(0.1)

    end
end
