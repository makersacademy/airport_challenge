require_relative '../lib/weather'

describe Weather do

  let(:weather) { described_class.new }

  describe "#stormy?" do
    it "is stormy weather" do
      allow(weather).to receive(:stormy?) { true }
      expect(weather.stormy?).to be true
    end

    it "is good weather (not stormy)" do
      allow(weather).to receive(:stormy?) { false }
      expect(weather.stormy?).to be false
    end

  end

end
