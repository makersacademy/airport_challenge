require_relative '../docs/weather.rb'

describe Weather do
  let(:weather) { Weather.new }
  let(:sunny) { double(:weather, :rand_num => 2) }
  let(:stormy) { double(:weather, :rand_num => 4) }

  it '.initialize sets up array of weather outcomes' do
    expect(weather.weather_generator).to eq(["sunny", "sunny", "sunny", "sunny", "stormy"])
  end

  it '.rand_num outputs a number between 0 and 4' do
    expect(weather.rand_num).to be_between(0, 4).inclusive
  end

  it '.not_safe? returns true/false' do
    expect(weather.not_safe?).to be(true).or be(false)
  end
end
