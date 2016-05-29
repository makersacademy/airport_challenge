require 'weather.rb'

describe Weather do

  describe "#stormy?" do

    let(:good_weather) { double :weather, check_storm: false }
    let(:bad_weather) { double :weather, check_storm: true }

    it "allows storm" do
      # weather = double("weather")
      # using let structure above instead
      allow(good_weather).to receive(:check_storm).and_return(false)
      expect(good_weather.check_storm).to be false
    end

    it "allows good weather" do
      allow(bad_weather).to receive(:check_storm).and_return(false)
      expect(bad_weather.check_storm).to be false
    end
  end

end
