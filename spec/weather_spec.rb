require 'weather.rb'

describe Weather do
  it 'returns "stormy" if 0 is passed' do
    expect(subject.getWeather(0)).to eq 'stormy'
  end
  
end
