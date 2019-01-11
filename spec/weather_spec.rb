require 'weather'

describe Weather do

  # it 'should allow the weather to receive request' do
  #   allow(Weather).to receive(:random_weather) { "sunny" }
  # end

  it 'should randomly return a weather condition' do
    srand(5)
    expect(Weather.new.random_weather).to eq 'sunny'
  end

end
