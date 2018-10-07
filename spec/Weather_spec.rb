require './Weather.rb'

describe Weather do
  it 'exists' do
    expect(Weather.new).not_to eq nil
  end

  it 'returns true or false in response to method "clear"' do
    weather = Weather.new
    if weather.clear == false || weather.clear == true
      conditions = 1
    end
    expect(conditions).to eq 1
  end
end