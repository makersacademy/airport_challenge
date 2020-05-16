require_relative '../lib/weather.rb'

describe Weather do
  describe '#check?' do
    it "should return false when forced to get 0 out of rand" do
      expect_any_instance_of(Weather).to receive(:rand).with(20).and_return(0)
      weather = Weather.new
      expect(weather.check?).to eq(false)
    end
    it "should return true for all other numbers" do
      expect_any_instance_of(Weather).to receive(:rand).with(20).and_return(3)
      weather = Weather.new
      expect(weather.check?).to eq(true)
    end
  end
end
