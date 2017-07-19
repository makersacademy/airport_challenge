require 'weather'
describe Weather do
subject(:weather) { Weather.new }
  it 'respond to a storm' do
    allow(weather).to receive(:rand) { 1 }
    expect(weather.storm).to eq true
  end
end
