require 'weather.rb'

describe Weather do
  it 'expects the airport to have weather' do
    weather = (Weather.new).check
    expect(weather).to eq weather
  end

  it 'expects the weather to be random' do
    expect(["Sunny", "Sunny", "Sunny", "Sunny", "Sunny", "Sunny", "Stormy"]).to include((Weather.new).check)
  end
end
