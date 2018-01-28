require "weather"
# require "airport"
# require "plane"

describe Weather do
  it { is_expected.to respond_to :stormy? }
end

  describe "stormy?" do
    it "checks if stormy is true or false" do
      weather = Weather.new
      expect(weather.stormy?).to eq(true).or(eq(false))
    end
  end
