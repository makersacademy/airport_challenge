require 'weather'

describe Weather do
subject(:weather) { described_class.new }

  it {is_expected.to respond_to(:current_weather)}

  context '#initialize'
    it "returns stromy weather when randomly generated weather is 'stormy' " do
      allow(weather).to receive(:current_weather) { :stormy }
      expect(weather.current_weather).to eq :stormy
    end

    it "returns sunny weather when randomly generated weather is 'sunny' " do
      allow(weather).to receive(:current_weather) { :sunny }
      expect(weather.current_weather).to eq :sunny
    end

end
