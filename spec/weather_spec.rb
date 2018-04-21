require 'weather'

describe Weather do
subject(:weather) { described_class.new }

  context "#stormy?"

    it "returns stromy weather when randomly generated weather is 'stormy' " do
      allow(weather).to receive(:random_weather) { :stormy }
      expect(weather).to be_stormy
    end

    it "returns sunny weather when randomly generated weather is 'sunny' " do
      allow(weather).to receive(:random_weather) { :sunny }
      expect(weather).not_to be_stormy
    end


end
