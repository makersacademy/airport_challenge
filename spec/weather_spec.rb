require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  it 'is stormy if rand(1..10) is > 8' do
    allow(weather).to receive(:rand).and_return(9)
    expect(weather.stormy?).to be true
  end
end
