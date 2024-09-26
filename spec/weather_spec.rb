require 'weather'

describe Weather do
  subject(:weather) { Weather.new }
  it 'checks if its stormy' do
    allow(weather).to receive(:rand).and_return 15
    expect(weather.stormy?).to eq true
  end
end
