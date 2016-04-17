require 'weather'

describe Weather do

  it 'the weather should be stormy' do
    expect(subject.weather_now).to eq('stormy')
  end

end
