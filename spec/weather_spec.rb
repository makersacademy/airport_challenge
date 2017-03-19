require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  describe '#stormy?' do
    it 'is stormy if even number' do
    allow(weather).to receive(:random) { 2 }
    expect(weather.stormy?).to eq true
    end

    it 'is NOT stormy if odd number' do
    allow(weather).to receive(:random) { 5 }
    expect(weather.stormy?).to eq false
    end

  end

end
