require_relative '../lib/weather.rb'

describe Weather do
  describe '#check?' do
    it "should return true when forced to get 0 out of rand" do
      expect(weather = Weather.new).to receive(:rand).with(20).and_return(0)
      expect(weather.stormy?).to eq(true)
    end
    it "should return false for all other numbers" do
      expect(weather = Weather.new).to receive(:rand).with(20).and_return(3)
      expect(weather.stormy?).to eq(false)
    end
  end
end
