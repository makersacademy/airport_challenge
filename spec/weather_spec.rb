require 'weather'

describe Weather do

  it { is_expected.to be_instance_of(Weather) }

  it 'returns stormy weather approximately one day in every 10' do
    storeweather = []
    10000.times do
      storeweather << subject.getweather
    end
    sunny = storeweather.count("sunny")
    stormy = storeweather.count("stormy")
    percentage = stormy.to_f / sunny.to_f
    expect(percentage).to be_within(0.05).of(0.1)
  end
end
