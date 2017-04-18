require './lib/weather'

describe Weather do
  let(:airport) { double :airport, name: 'the Airport' }
  it '#weather can be #sunny or #stormy' do
    weather = Weather.new(airport)
    expect(weather.condition).to eq("Sunny").or(eq("Stormy"))
  end

end
