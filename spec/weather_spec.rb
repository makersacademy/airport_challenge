require "weather"

describe Weather do

  let(:weather) { described_class.new }

  it "sets a random weather state" do
    expect(weather.states.any?(weather.current_state)).to be
  end

  describe "#stormy?" do
    it "returns true if weather is stormy" do
      weather.current_state = :stormy
      expect(weather.stormy?).to be 
    end
  end

end
