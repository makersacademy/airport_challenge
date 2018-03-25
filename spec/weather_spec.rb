require 'weather'

describe Weather do

  it 'Unit test: Allows the weather to become stormy' do
    weather = Weather.new
    expect(weather.stormy).to eq false
  end

end
