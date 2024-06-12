require 'Weather.rb'

describe Weather do

  let (:weatheroutcome) { Weather.new }

  it 'weather_outcome method outputs correct weather' do
    weatheroutcome.stub(:random_number) { 1 }
    expect(weatheroutcome.weather_outcome).to eq("Sunny")
  end

  it 'weather_outcome method outputs correct weather' do
    weatheroutcome.stub(:random_number) { 10 }
    expect(weatheroutcome.weather_outcome).to eq("Storm")
  end

  it 'weather_outcome method outputs correct weather' do
    weatheroutcome.stub(:random_number) { 5 }
    expect(weatheroutcome.weather_outcome).to eq("Sunny")
  end

end
