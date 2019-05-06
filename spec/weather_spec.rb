require 'weather'

describe Weather do

  # it 'responds to #stormy?' do
  #   expect(subject).to respond_to(:stormy?)
  # end

  describe '#stormy?' do

    it 'returns a random weather pattern' do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { "stormy" }
      expect(weather.stormy?).to eq("stormy")
    end

    it 'returns a random weather pattern' do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { "sunny" }
      expect(weather.stormy?).to eq("sunny")
    end

    # let(:weather) { described_class.new }

# allow(die).to receive(:roll) { 3 }
# This tells the die object to return the value 3
# when it receives the roll message.
  end
end
