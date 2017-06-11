
require_relative "../lib/weather.rb"


describe Weather do

  subject(:weather) { described_class.new }

  describe "#stormy" do

    before do
      allow(weather).to receive(:conditions)
    end

    it "instructs the weather to check its condition" do
      expect(weather).to receive(:conditions)
      weather.stormy?
    end

    context "when stormy" do

      before do
        allow(weather).to receive(:conditions).and_return(:stormy)
      end

      it "returns true" do
        expect(weather.stormy?).to be true
      end

    end

    context "when anything other than stormy" do

      before do
        allow(weather).to receive(:conditions).and_return(:sunny, :fair, :cloudy)
      end

      it "returns false" do
        Weather::OUTLOOK.size.times { expect(weather.stormy?).to be false }
      end

    end

  end

end
