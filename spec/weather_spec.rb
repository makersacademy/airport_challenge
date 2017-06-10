
require_relative "../lib/weather.rb"

describe Weather do

  # missing test might be about initialize

  subject(:weather) { described_class.new }

  let(:sunny_weather) { Weather.new }
  let(:fair_weather) { Weather.new }
  let(:cloudy_weather) { Weather.new }
  let(:stormy_weather) { Weather.new }


  describe "#create_weather" do

    it "samples weather conditions" do
        expect(Weather::WEATHER).to receive(:sample)
        Weather.new
    end

    before do
      allow(Weather::WEATHER).to receive(:sample).and_return(:sunny, :fair, :cloudy, :stormy)
    end

    it "sets the weather randomly" do
      expect(sunny_weather.conditions).to be :sunny
      expect(fair_weather.conditions).to be :fair
      expect(cloudy_weather.conditions).to be :cloudy
      expect(stormy_weather.conditions).to be :stormy
    end

  end

  describe "#stormy?" do

    context "when weather is stormy" do

        before do
          allow(Weather::WEATHER).to receive(:sample).and_return(:stormy)
        end

        it "confirms this" do
          stormy_weather.stormy?
        end

    end

    context "when weather isn't stormy" do

      before do
        allow(Weather::WEATHER).to receive(:sample).and_return(:sunny)
      end

      it "returns false" do
        expect(sunny_weather.stormy?).to be false
      end

    end

  end


end
