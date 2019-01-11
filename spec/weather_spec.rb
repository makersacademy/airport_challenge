require 'weather'

describe Weather do

  it 'should randomly return a weather condition' do
    srand(5)
    expect(Weather.new.random_weather).to eq 'sunny'
  end

end
