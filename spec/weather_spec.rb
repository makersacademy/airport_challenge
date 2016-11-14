require './lib/weather'

describe Weather do

  it 'returns "true" when it is stormy' do
    subject.weather_code = 0.1
    expect(subject.stormy?).to eq true
  end

  it 'returns "false" when it is not stormy' do
    subject.weather_code = 0.5
    expect(subject.stormy?).to eq false
  end

end
