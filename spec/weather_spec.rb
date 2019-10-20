require "weather"

describe Weather do

  weather = Weather.new

  context "is stormy" do

    it "is expected to be stormy" do
      expect(weather.stormy).to eq true
    end

  end

  context "is sunny" do

    it "is expected to be sunny" do
      expect(weather.sunny).to eq true
    end

  end

end
