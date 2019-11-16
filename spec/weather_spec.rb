require 'weather'

describe Weather do
  describe "#stormy?" do
    it "returns true if the weather is stormy" do
      subject.instance_variable_set(:@weather_forecast, 2)
      expect(subject.stormy?).to eq true
    end
  end
end
