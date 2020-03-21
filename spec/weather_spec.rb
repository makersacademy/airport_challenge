require 'weather'

describe Weather do
  it 'allows you to ask what the weather is like at the moment' do
    expect(Weather).to respond_to(:current_weather)  
  end

  it 'should tell you it is either stormy or clear' do
    expect(Weather.current_weather).to eq(:stormy).or eq(:clear)
  end
end
