require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Weather do

it {is_expected.to respond_to :stormy?}
it 'it returns true if weather is stormy and false if sunny' do
weather = double('weather')
allow(weather).to receive(:stormy?).and_return(true,false)
expect(weather.stormy?).to eq true
expect(weather.stormy?).to eq false
expect(weather.stormy?).to eq false
end
end
