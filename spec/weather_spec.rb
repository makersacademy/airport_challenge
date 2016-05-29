require 'weather.rb'

describe Weather do

  describe "#stormy?" do

    let(:good_weather) { double :weather, is_stormy?: false }
    let(:bad_weather) { double :weather, is_stormy?: true }

    it "allows storm" do
      # weather = double("weather")
      # using let structure above instead
      allow(good_weather).to receive(:stormy?).and_return(false)
      expect(good_weather.stormy?).to be false
    end

    it "allows good weather" do
      allow(bad_weather).to receive(:stormy?).and_return(false)
      expect(bad_weather.stormy?).to be false
    end
  end

end
