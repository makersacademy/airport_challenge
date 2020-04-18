require 'weather'

describe Weather do

  it 'responds to stormy?' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'returns true or false' do
    weather = Weather.new
    expect(weather.stormy?).to eq(true).or eq(false)
  end

end
