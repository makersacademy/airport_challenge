require './lib/weather.rb'

describe Weather do

  describe '#stormy?' do

    it "returns false" do
      weather = Weather.new
      allow(Kernel).to receive(:rand).with(0..1).and_return(0)
      expect(weather.stormy?).to eq(false)
    end

    it "returns true" do
      weather = Weather.new
      allow(Kernel).to receive(:rand).with(0..1).and_return(1)
      expect(weather.stormy?).to eq(true)
    end

  end
end
