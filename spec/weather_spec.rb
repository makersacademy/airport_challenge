require 'weather'
describe Weather do
  it 'checks the weather' do
    weather = Weather.new
    expect { weather.stormy }.to raise_error('No planes can take off, too stormy')
  end
end
