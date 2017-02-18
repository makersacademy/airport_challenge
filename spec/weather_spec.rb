require 'weather'

describe Weather do

  it 'is stormy' do
    weather = Weather.new("stormy")
    expect(weather.status).to eq "stormy"
  end

end
