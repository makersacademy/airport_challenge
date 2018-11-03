require 'weather.rb'

describe Weather do

  describe '#weather_rand'
  it { is_expected.to respond_to :weather_rand }

  it 'return random numbers for weather_rand' do
    expect(subject.weather_rand).to be_between(0, 100)
  end

end
