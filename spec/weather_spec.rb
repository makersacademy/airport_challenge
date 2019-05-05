require 'weather'

describe Weather do
  it 'checks conditions are good' do
    weather = Weather.new
    expect(weather.condition).to eq('good').or eq('bad')
  end
end
