require "weather"

describe Weather do

  describe "#Weather conditions" do

    it { is_expected.to respond_to(:weather_condition) }

    it "Checks if weather is stormy?" do
      weather = Weather.new
      expect(subject.weather_condition).to eq false
    end

  end

end
