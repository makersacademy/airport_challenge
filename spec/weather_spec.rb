require "weather.rb"

describe Weather do

  describe "#bad_weather?" do
    it "should return a weather condition returns bad weather" do  # <--user story 3
      weather = described_class.new
      Kernel.stub(:rand) {0.90}
      expect(weather.bad_weather?).to eq true
    end
  end
end
