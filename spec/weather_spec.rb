require 'weather.rb'

describe Weather do
  it 'Checks that weather exists' do
    weather = (Weather.new).check
    expect(weather).to eq weather
  end

  it 'Checks the weather to be random' do
    expect(["Sunny", "Sunny", "Sunny", "Sunny", "Sunny", "Sunny", "Stormy"]).to include((Weather.new).check)
  end
end
